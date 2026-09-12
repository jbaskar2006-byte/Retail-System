package main

import (
	"database/sql"
	"fmt"
	"log"
	"math"
	"math/rand"
	"strconv"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
	_ "github.com/go-sql-driver/mysql"
	"github.com/robfig/cron/v3"
)

// ─────────────────────────────────────────────
// DATABASE CONFIG
// ─────────────────────────────────────────────
type DBConfig struct {
	DSN     string
	StoreID int
	Name    string
}

var (
	db1    *sql.DB
	db2    *sql.DB
	db3    *sql.DB
	master *sql.DB
)

// ─────────────────────────────────────────────
// MODELS
// ─────────────────────────────────────────────
type Product struct {
	ID         int     `json:"id"`
	Name       string  `json:"name"`
	Category   string  `json:"category"`
	Price      float64 `json:"price"`
	CostPrice  float64 `json:"cost_price"`
	Stock      int     `json:"stock"`
	ExpiryDate string  `json:"expiry_date"`
	StoreID    int     `json:"store_id"`
	StoreName  string  `json:"store_name"`
	DaysToExp  int     `json:"days_to_expiry"`
	Profit     float64 `json:"profit_margin"`
}

type Customer struct {
	ID        int    `json:"id"`
	Name      string `json:"name"`
	Phone     string `json:"phone"`
	IsRegular bool   `json:"is_regular"`
	StoreID   int    `json:"store_id"`
	StoreName string `json:"store_name"`
}

type Order struct {
	ID          int     `json:"id"`
	CustomerID  int     `json:"customer_id"`
	TotalAmount float64 `json:"total_amount"`
	OrderType   string  `json:"order_type"`
	OrderDate   string  `json:"order_date"`
	StoreID     int     `json:"store_id"`
	StoreName   string  `json:"store_name"`
}

type Worker struct {
	ID       int     `json:"id"`
	Name     string  `json:"name"`
	Phone    string  `json:"phone"`
	Role     string  `json:"role"`
	StoreID  int     `json:"store_id"`
	Salary   float64 `json:"salary"`
	Store    string  `json:"store_name"`
}

type AttendanceStat struct {
	WorkerID   int     `json:"worker_id"`
	WorkerName string  `json:"worker_name"`
	Phone      string  `json:"phone"`
	Role       string  `json:"role"`
	StoreID    int     `json:"store_id"`
	Present    int     `json:"present"`
	Absent     int     `json:"absent"`
	Leave      int     `json:"leave"`
	Rate       float64 `json:"attendance_rate"`
}

type Loan struct {
	ID               int     `json:"id"`
	StoreID          int     `json:"store_id"`
	StoreName        string  `json:"store_name"`
	TotalLoan        float64 `json:"total_loan"`
	InterestRate     float64 `json:"interest_rate"`
	EmiAmount        float64 `json:"emi_amount"`
	RemainingBalance float64 `json:"remaining_balance"`
	StartDate        string  `json:"start_date"`
	EndDate          string  `json:"end_date"`
	Lender           string  `json:"lender"`
	Status           string  `json:"status"`
}

type Advertisement struct {
	ID          int     `json:"id"`
	StoreID     int     `json:"store_id"`
	StoreName   string  `json:"store_name"`
	Type        string  `json:"type"`
	Amount      float64 `json:"amount"`
	Month       string  `json:"month"`
	Platform    string  `json:"platform"`
	Impressions int     `json:"impressions"`
	Conversions int     `json:"conversions"`
	ROI         float64 `json:"roi"`
}

type Alert struct {
	ID        int    `json:"id"`
	StoreID   int    `json:"store_id"`
	AlertType string `json:"alert_type"`
	Title     string `json:"title"`
	Message   string `json:"message"`
	IsRead    bool   `json:"is_read"`
	CreatedAt string `json:"created_at"`
}

type AIDecision struct {
	ID           int    `json:"id"`
	StoreID      int    `json:"store_id"`
	Category     string `json:"category"`
	Message      string `json:"message"`
	DecisionType string `json:"decision_type"`
	AlertType    string `json:"alert_type"`
	CreatedAt    string `json:"created_at"`
}

type AnalyticsResponse struct {
	Data      interface{} `json:"data"`
	Insight   string      `json:"insight"`
	Decision  string      `json:"decision"`
	AlertType string      `json:"alertType"`
}

type DashboardSummary struct {
	TotalRevenue    float64 `json:"total_revenue"`
	TotalOrders     int     `json:"total_orders"`
	TotalProducts   int     `json:"total_products"`
	TotalCustomers  int     `json:"total_customers"`
	TotalWorkers    int     `json:"total_workers"`
	LowStockItems   int     `json:"low_stock_items"`
	OutOfStock      int     `json:"out_of_stock"`
	ExpiringItems   int     `json:"expiring_items"`
	TotalProfit     float64 `json:"total_profit"`
	AvgOrderValue   float64 `json:"avg_order_value"`
	OnlineOrders    int     `json:"online_orders"`
	StoreOrders     int     `json:"store_orders"`
	PresentWorkers  int     `json:"present_workers_today"`
	AbsentWorkers   int     `json:"absent_workers_today"`
	TotalEMI        float64 `json:"total_emi"`
	StoreRevenues   []StoreRevenue `json:"store_revenues"`
	SystemHealth    float64 `json:"system_health"`
	AlertCount      int     `json:"alert_count"`
}

type StoreRevenue struct {
	StoreID   int     `json:"store_id"`
	StoreName string  `json:"store_name"`
	Revenue   float64 `json:"revenue"`
	Orders    int     `json:"orders"`
	Profit    float64 `json:"profit"`
}

type CategorySales struct {
	Category string  `json:"category"`
	Revenue  float64 `json:"revenue"`
	Quantity int     `json:"quantity"`
	StoreID  int     `json:"store_id"`
}

type DailyTrend struct {
	Date     string  `json:"date"`
	Revenue  float64 `json:"revenue"`
	Orders   int     `json:"orders"`
	StoreID  int     `json:"store_id"`
}

type ProductSales struct {
	ProductID int     `json:"product_id"`
	Name      string  `json:"name"`
	Category  string  `json:"category"`
	Quantity  int     `json:"quantity"`
	Revenue   float64 `json:"revenue"`
	StoreID   int     `json:"store_id"`
}

type SalaryReport struct {
	WorkerName  string  `json:"worker_name"`
	Role        string  `json:"role"`
	BasicSalary float64 `json:"basic_salary"`
	Bonus       float64 `json:"bonus"`
	Total       float64 `json:"total_salary"`
	Month       string  `json:"month"`
	StoreID     int     `json:"store_id"`
}

type OrderRequest struct {
	CustomerID int            `json:"customer_id"`
	StoreID    int            `json:"store_id"`
	OrderType  string         `json:"order_type"`
	Items      []OrderItemReq `json:"items"`
}

type OrderItemReq struct {
	ProductID int `json:"product_id"`
	Quantity  int `json:"quantity"`
}

// ─────────────────────────────────────────────
// MAIN
// ─────────────────────────────────────────────
func main() {
	// Connect databases
	connectDBs()
	
	// Start cron scheduler
	startScheduler()

	// Create Fiber app
	app := fiber.New(fiber.Config{
		ErrorHandler: func(c *fiber.Ctx, err error) error {
			return c.Status(500).JSON(fiber.Map{"error": err.Error()})
		},
	})

	// CORS
	app.Use(cors.New(cors.Config{
		AllowOrigins: "*",
		AllowMethods: "GET,POST,PUT,DELETE,OPTIONS",
		AllowHeaders: "Content-Type,Authorization",
	}))

	// ─── ROUTES ───────────────────────────────
	api := app.Group("/api")

	// Dashboard
	api.Get("/dashboard", handleDashboard)

	// Products
	api.Get("/products", handleProducts)
	api.Post("/inventory/refill", handleRefill)

	// Orders
	api.Get("/orders", handleOrders)
	api.Post("/orders", handlePlaceOrder)

	// Analytics
	api.Get("/analytics/revenue", handleRevenue)
	api.Get("/analytics/sales", handleCategorySales)
	api.Get("/analytics/trends", handleTrends)
	api.Get("/analytics/customers", handleCustomers)
	api.Get("/analytics/workforce", handleWorkforce)
	api.Get("/analytics/finance", handleFinance)
	api.Get("/analytics/expiry", handleExpiry)
	api.Get("/analytics/unsold", handleUnsold)
	api.Get("/analytics/top-products", handleTopProducts)
	api.Get("/analytics/ai-decisions", handleAIDecisions)
	api.Get("/analytics/store-compare", handleStoreCompare)
	api.Get("/analytics/salary", handleSalary)
	api.Get("/analytics/loans", handleLoans)
	api.Get("/analytics/ads", handleAds)
	api.Get("/analytics/demand", handleDemandPrediction)

	// Alerts
	api.Get("/alerts", handleAlerts)
	api.Put("/alerts/:id/read", handleMarkAlertRead)

	// Workers
	api.Get("/workers", handleWorkers)
	api.Get("/attendance", handleAttendance)

	// Simulate
	api.Post("/simulate", handleSimulate)

	// Health
	api.Get("/health", handleHealth)

	log.Println("🚀 Smart Retail Analytics API running on port 8080")
	log.Fatal(app.Listen(":8080"))
}

// ─────────────────────────────────────────────
// DB CONNECTION
// ─────────────────────────────────────────────
func connectDBs() {
	configs := []struct {
		db   **sql.DB
		name string
		dsn  string
	}{
		{&db1, "db_store1", "root:Root@123@tcp(127.0.0.1:3306)/db_store1?parseTime=true"},
		{&db2, "db_store2", "root:Root@123@tcp(127.0.0.1:3306)/db_store2?parseTime=true"},
		{&db3, "db_store3", "root:Root@123@tcp(127.0.0.1:3306)/db_store3?parseTime=true"},
		{&master, "db_master", "root:Root@123@tcp(127.0.0.1:3306)/db_master?parseTime=true"},
	}

	for _, cfg := range configs {
		db, err := sql.Open("mysql", cfg.dsn)
		if err != nil {
			log.Printf("⚠️  Failed to open %s: %v", cfg.name, err)
			continue
		}
		db.SetMaxOpenConns(25)
		db.SetMaxIdleConns(10)
		db.SetConnMaxLifetime(5 * time.Minute)
		if err = db.Ping(); err != nil {
			log.Printf("⚠️  Cannot ping %s: %v", cfg.name, err)
		} else {
			log.Printf("✅ Connected to %s", cfg.name)
		}
		*cfg.db = db
	}
}

// ─────────────────────────────────────────────
// HELPERS
// ─────────────────────────────────────────────
func getStoreDBs(storeID int) []*sql.DB {
	switch storeID {
	case 1:
		return []*sql.DB{db1}
	case 2:
		return []*sql.DB{db2}
	case 3:
		return []*sql.DB{db3}
	default:
		return []*sql.DB{db1, db2, db3}
	}
}

func getStoreIDs(storeID int) []int {
	if storeID > 0 {
		return []int{storeID}
	}
	return []int{1, 2, 3}
}

func storeName(id int) string {
	switch id {
	case 1:
		return "Store 1 - North"
	case 2:
		return "Store 2 - South"
	case 3:
		return "Store 3 - East"
	}
	return "All Stores"
}

func nullableStr(ns sql.NullString) string {
	if ns.Valid {
		return ns.String
	}
	return ""
}

func nullableFloat(nf sql.NullFloat64) float64 {
	if nf.Valid {
		return nf.Float64
	}
	return 0
}

func nullableInt(ni sql.NullInt64) int {
	if ni.Valid {
		return int(ni.Int64)
	}
	return 0
}

func parseStoreID(c *fiber.Ctx) int {
	s := c.Query("store", "0")
	id, _ := strconv.Atoi(s)
	return id
}

func round2(v float64) float64 {
	return math.Round(v*100) / 100
}

// ─────────────────────────────────────────────
// DASHBOARD
// ─────────────────────────────────────────────
func handleDashboard(c *fiber.Ctx) error {
	storeID := parseStoreID(c)
	dbs := getStoreDBs(storeID)
	ids := getStoreIDs(storeID)

	summary := DashboardSummary{}

	for i, db := range dbs {
		sid := ids[i]

		// Revenue & Orders
		var rev sql.NullFloat64
		var orders, online, store int
		db.QueryRow("SELECT SUM(total_amount), COUNT(*), SUM(order_type='online'), SUM(order_type='store') FROM orders").
			Scan(&rev, &orders, &online, &store)
		summary.TotalRevenue += nullableFloat(rev)
		summary.TotalOrders += orders
		summary.OnlineOrders += online
		summary.StoreOrders += store

		// Products
		var total, lowStock, outOfStock, expiring int
		db.QueryRow("SELECT COUNT(*), SUM(stock<5 AND stock>0), SUM(stock=0), SUM(expiry_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(),INTERVAL 3 DAY)) FROM products").
			Scan(&total, &lowStock, &outOfStock, &expiring)
		summary.TotalProducts += total
		summary.LowStockItems += lowStock
		summary.OutOfStock += outOfStock
		summary.ExpiringItems += expiring

		// Profit
		var profit sql.NullFloat64
		db.QueryRow(`SELECT SUM((p.price - p.cost_price) * oi.quantity) 
			FROM order_items oi JOIN products p ON p.id=oi.product_id`).Scan(&profit)
		summary.TotalProfit += nullableFloat(profit)

		// Customers
		var custs int
		db.QueryRow("SELECT COUNT(*) FROM customers").Scan(&custs)
		summary.TotalCustomers += custs

		// Workers
		var workers int
		db.QueryRow("SELECT COUNT(*) FROM workers").Scan(&workers)
		summary.TotalWorkers += workers

		// Attendance today
		var present, absent int
		db.QueryRow("SELECT SUM(status='present'), SUM(status='absent') FROM attendance WHERE date=CURDATE()").
			Scan(&present, &absent)
		summary.PresentWorkers += present
		summary.AbsentWorkers += absent

		// EMI
		var emi sql.NullFloat64
		db.QueryRow("SELECT SUM(emi_amount) FROM loans WHERE status='active'").Scan(&emi)
		summary.TotalEMI += nullableFloat(emi)

		// Store revenue
		sr := StoreRevenue{StoreID: sid, StoreName: storeName(sid)}
		db.QueryRow("SELECT SUM(total_amount), COUNT(*) FROM orders").Scan(&rev, &orders)
		sr.Revenue = round2(nullableFloat(rev))
		sr.Orders = orders
		db.QueryRow(`SELECT SUM((p.price-p.cost_price)*oi.quantity) 
			FROM order_items oi JOIN products p ON p.id=oi.product_id`).Scan(&profit)
		sr.Profit = round2(nullableFloat(profit))
		summary.StoreRevenues = append(summary.StoreRevenues, sr)
	}

	if summary.TotalOrders > 0 {
		summary.AvgOrderValue = round2(summary.TotalRevenue / float64(summary.TotalOrders))
	}
	summary.TotalRevenue = round2(summary.TotalRevenue)
	summary.TotalProfit = round2(summary.TotalProfit)

	// System health score
	health := 100.0
	if summary.LowStockItems > 0 {
		health -= float64(summary.LowStockItems) * 0.5
	}
	if summary.OutOfStock > 0 {
		health -= float64(summary.OutOfStock) * 2.0
	}
	if summary.ExpiringItems > 0 {
		health -= float64(summary.ExpiringItems) * 1.0
	}
	if summary.TotalWorkers > 0 && summary.AbsentWorkers > 0 {
		absentRate := float64(summary.AbsentWorkers) / float64(summary.TotalWorkers) * 100
		health -= absentRate
	}
	if health < 0 {
		health = 0
	}
	summary.SystemHealth = round2(health)

	// Alert count from master
	if master != nil {
		master.QueryRow("SELECT COUNT(*) FROM system_alerts WHERE is_read=0").Scan(&summary.AlertCount)
	}

	return c.JSON(AnalyticsResponse{
		Data:      summary,
		Insight:   fmt.Sprintf("Total revenue ₹%.2f from %d orders across %d stores", summary.TotalRevenue, summary.TotalOrders, len(dbs)),
		Decision:  generateDashboardDecision(summary),
		AlertType: dashboardAlertType(summary),
	})
}

func generateDashboardDecision(s DashboardSummary) string {
	if s.OutOfStock > 5 {
		return fmt.Sprintf("⚠️ %d products are out of stock - immediate restocking required!", s.OutOfStock)
	}
	if s.ExpiringItems > 3 {
		return fmt.Sprintf("🕐 %d items expiring within 3 days - apply discount to reduce loss", s.ExpiringItems)
	}
	if s.AbsentWorkers > s.PresentWorkers/3 {
		return fmt.Sprintf("👥 High absenteeism detected (%d absent) - arrange backup staff", s.AbsentWorkers)
	}
	return fmt.Sprintf("✅ System healthy at %.0f%% - Revenue on track at ₹%.2f", s.SystemHealth, s.TotalRevenue)
}

func dashboardAlertType(s DashboardSummary) string {
	if s.OutOfStock > 5 || s.AbsentWorkers > 5 {
		return "danger"
	}
	if s.LowStockItems > 10 || s.ExpiringItems > 5 {
		return "warning"
	}
	return "success"
}

// ─────────────────────────────────────────────
// PRODUCTS
// ─────────────────────────────────────────────
func handleProducts(c *fiber.Ctx) error {
	storeID := parseStoreID(c)
	category := c.Query("category", "")
	dbs := getStoreDBs(storeID)
	ids := getStoreIDs(storeID)

	var products []Product
	for i, db := range dbs {
		sid := ids[i]
		query := `SELECT id, name, category, price, cost_price, stock, 
			IFNULL(expiry_date,''), store_id,
			DATEDIFF(expiry_date, CURDATE()) as days_to_exp
			FROM products WHERE 1=1`
		args := []interface{}{}
		if category != "" {
			query += " AND category=?"
			args = append(args, category)
		}
		query += " ORDER BY stock ASC"

		rows, err := db.Query(query, args...)
		if err != nil {
			continue
		}
		defer rows.Close()

		for rows.Next() {
			var p Product
			var daysToExp sql.NullInt64
			rows.Scan(&p.ID, &p.Name, &p.Category, &p.Price, &p.CostPrice,
				&p.Stock, &p.ExpiryDate, &p.StoreID, &daysToExp)
			p.StoreID = sid
			p.StoreName = storeName(sid)
			p.DaysToExp = nullableInt(daysToExp)
			p.Profit = round2(p.Price - p.CostPrice)
			products = append(products, p)
		}
	}

	return c.JSON(AnalyticsResponse{
		Data:      products,
		Insight:   fmt.Sprintf("Showing %d products", len(products)),
		Decision:  "Monitor low stock items and expiring products",
		AlertType: "info",
	})
}

// ─────────────────────────────────────────────
// PLACE ORDER
// ─────────────────────────────────────────────
func handlePlaceOrder(c *fiber.Ctx) error {
	var req OrderRequest
	if err := c.BodyParser(&req); err != nil {
		return c.Status(400).JSON(fiber.Map{"error": "Invalid request"})
	}

	var db *sql.DB
	switch req.StoreID {
	case 1:
		db = db1
	case 2:
		db = db2
	case 3:
		db = db3
	default:
		return c.Status(400).JSON(fiber.Map{"error": "Invalid store ID"})
	}

	// Start transaction
	tx, err := db.Begin()
	if err != nil {
		return c.Status(500).JSON(fiber.Map{"error": "Transaction failed"})
	}

	// Validate stock
	totalAmount := 0.0
	type itemInfo struct {
		price float64
	}
	infos := make([]itemInfo, len(req.Items))

	for i, item := range req.Items {
		var stock int
		var price float64
		err := tx.QueryRow("SELECT stock, price FROM products WHERE id=?", item.ProductID).Scan(&stock, &price)
		if err != nil {
			tx.Rollback()
			return c.Status(404).JSON(fiber.Map{"error": fmt.Sprintf("Product %d not found", item.ProductID)})
		}
		if stock < item.Quantity {
			tx.Rollback()
			return c.Status(400).JSON(fiber.Map{
				"error": fmt.Sprintf("Insufficient stock for product %d (available: %d)", item.ProductID, stock),
			})
		}
		infos[i] = itemInfo{price: price}
		totalAmount += price * float64(item.Quantity)
	}

	// Insert order
	result, err := tx.Exec(
		"INSERT INTO orders (customer_id, total_amount, order_type, order_date) VALUES (?,?,?,NOW())",
		req.CustomerID, totalAmount, req.OrderType,
	)
	if err != nil {
		tx.Rollback()
		return c.Status(500).JSON(fiber.Map{"error": "Failed to create order"})
	}
	orderID, _ := result.LastInsertId()

	// Insert items & reduce stock
	for i, item := range req.Items {
		tx.Exec(
			"INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES (?,?,?,?)",
			orderID, item.ProductID, item.Quantity, infos[i].price,
		)
		tx.Exec("UPDATE products SET stock=stock-? WHERE id=?", item.Quantity, item.ProductID)

		// Check low stock after update
		var newStock int
		tx.QueryRow("SELECT stock FROM products WHERE id=?", item.ProductID).Scan(&newStock)
		if newStock < 5 && master != nil {
			var pname string
			tx.QueryRow("SELECT name FROM products WHERE id=?", item.ProductID).Scan(&pname)
			alertType := "warning"
			title := "Low Stock Alert"
			msg := fmt.Sprintf("%s has only %d units left at %s", pname, newStock, storeName(req.StoreID))
			if newStock == 0 {
				alertType = "danger"
				title = "Out of Stock"
				msg = fmt.Sprintf("%s is now OUT OF STOCK at %s", pname, storeName(req.StoreID))
			}
			master.Exec("INSERT INTO system_alerts (store_id, alert_type, title, message) VALUES (?,?,?,?)",
				req.StoreID, alertType, title, msg)
		}
	}

	if err = tx.Commit(); err != nil {
		return c.Status(500).JSON(fiber.Map{"error": "Commit failed"})
	}

	return c.Status(201).JSON(fiber.Map{
		"message":  "Order placed successfully",
		"order_id": orderID,
		"total":    round2(totalAmount),
	})
}

// ─────────────────────────────────────────────
// ORDERS LIST
// ─────────────────────────────────────────────
func handleOrders(c *fiber.Ctx) error {
	storeID := parseStoreID(c)
	limit := c.Query("limit", "50")
	dbs := getStoreDBs(storeID)
	ids := getStoreIDs(storeID)

	var orders []Order
	for i, db := range dbs {
		sid := ids[i]
		rows, err := db.Query(
			`SELECT id, IFNULL(customer_id,0), total_amount, order_type, 
			DATE_FORMAT(order_date,'%Y-%m-%d %H:%i') FROM orders ORDER BY order_date DESC LIMIT ?`,
			limit)
		if err != nil {
			continue
		}
		defer rows.Close()
		for rows.Next() {
			var o Order
			rows.Scan(&o.ID, &o.CustomerID, &o.TotalAmount, &o.OrderType, &o.OrderDate)
			o.StoreID = sid
			o.StoreName = storeName(sid)
			orders = append(orders, o)
		}
	}

	return c.JSON(AnalyticsResponse{
		Data:      orders,
		Insight:   fmt.Sprintf("%d orders retrieved", len(orders)),
		Decision:  "Analyze order patterns for peak time optimization",
		AlertType: "info",
	})
}

// ─────────────────────────────────────────────
// REFILL INVENTORY
// ─────────────────────────────────────────────
func handleRefill(c *fiber.Ctx) error {
	type RefillReq struct {
		StoreID   int `json:"store_id"`
		ProductID int `json:"product_id"`
		Quantity  int `json:"quantity"`
	}
	var req RefillReq
	if err := c.BodyParser(&req); err != nil {
		return c.Status(400).JSON(fiber.Map{"error": "Invalid request"})
	}

	var db *sql.DB
	switch req.StoreID {
	case 1:
		db = db1
	case 2:
		db = db2
	case 3:
		db = db3
	default:
		return c.Status(400).JSON(fiber.Map{"error": "Invalid store ID"})
	}

	_, err := db.Exec("UPDATE products SET stock=stock+? WHERE id=?", req.Quantity, req.ProductID)
	if err != nil {
		return c.Status(500).JSON(fiber.Map{"error": "Refill failed"})
	}

	var newStock int
	var pname string
	db.QueryRow("SELECT stock, name FROM products WHERE id=?", req.ProductID).Scan(&newStock, &pname)

	return c.JSON(fiber.Map{
		"message":   fmt.Sprintf("Restocked %s with %d units", pname, req.Quantity),
		"new_stock": newStock,
	})
}

// ─────────────────────────────────────────────
// ANALYTICS: REVENUE
// ─────────────────────────────────────────────
func handleRevenue(c *fiber.Ctx) error {
	storeID := parseStoreID(c)
	dbs := getStoreDBs(storeID)
	ids := getStoreIDs(storeID)

	type RevenueData struct {
		StoreID   int     `json:"store_id"`
		StoreName string  `json:"store_name"`
		Revenue   float64 `json:"revenue"`
		Profit    float64 `json:"profit"`
		Orders    int     `json:"orders"`
		AvgOrder  float64 `json:"avg_order"`
		Online    float64 `json:"online_revenue"`
		InStore   float64 `json:"store_revenue"`
	}

	var results []RevenueData
	totalRev := 0.0

	for i, db := range dbs {
		sid := ids[i]
		var rd RevenueData
		rd.StoreID = sid
		rd.StoreName = storeName(sid)

		var rev, online, instore, profit sql.NullFloat64
		db.QueryRow(`SELECT SUM(total_amount), SUM(CASE WHEN order_type='online' THEN total_amount ELSE 0 END),
			SUM(CASE WHEN order_type='store' THEN total_amount ELSE 0 END), COUNT(*) FROM orders`).
			Scan(&rev, &online, &instore, &rd.Orders)

		db.QueryRow(`SELECT SUM((p.price-p.cost_price)*oi.quantity) 
			FROM order_items oi JOIN products p ON p.id=oi.product_id`).Scan(&profit)

		rd.Revenue = round2(nullableFloat(rev))
		rd.Online = round2(nullableFloat(online))
		rd.InStore = round2(nullableFloat(instore))
		rd.Profit = round2(nullableFloat(profit))
		if rd.Orders > 0 {
			rd.AvgOrder = round2(rd.Revenue / float64(rd.Orders))
		}
		totalRev += rd.Revenue
		results = append(results, rd)
	}

	insight := fmt.Sprintf("Combined revenue: ₹%.2f across %d stores", totalRev, len(dbs))
	decision := "Revenue performing well. Focus on increasing online orders."
	alertType := "success"
	if totalRev < 50000 {
		decision = "Revenue below target. Run promotional campaigns."
		alertType = "warning"
	}

	return c.JSON(AnalyticsResponse{
		Data:      results,
		Insight:   insight,
		Decision:  decision,
		AlertType: alertType,
	})
}

// ─────────────────────────────────────────────
// ANALYTICS: CATEGORY SALES
// ─────────────────────────────────────────────
func handleCategorySales(c *fiber.Ctx) error {
	storeID := parseStoreID(c)
	dbs := getStoreDBs(storeID)
	ids := getStoreIDs(storeID)

	catMap := make(map[string]*CategorySales)

	for i, db := range dbs {
		sid := ids[i]
		rows, err := db.Query(`
			SELECT p.category, SUM(oi.quantity*oi.unit_price), SUM(oi.quantity)
			FROM order_items oi JOIN products p ON p.id=oi.product_id
			GROUP BY p.category ORDER BY SUM(oi.quantity*oi.unit_price) DESC`)
		if err != nil {
			continue
		}
		defer rows.Close()

		for rows.Next() {
			var cs CategorySales
			rows.Scan(&cs.Category, &cs.Revenue, &cs.Quantity)
			cs.StoreID = sid
			cs.Revenue = round2(cs.Revenue)

			if storeID == 0 {
				if existing, ok := catMap[cs.Category]; ok {
					existing.Revenue += cs.Revenue
					existing.Quantity += cs.Quantity
				} else {
					c2 := cs
					catMap[cs.Category] = &c2
				}
			} else {
				catMap[cs.Category+strconv.Itoa(sid)] = &cs
			}
		}
	}

	var results []CategorySales
	for _, cs := range catMap {
		results = append(results, *cs)
	}

	topCat := ""
	maxRev := 0.0
	for _, cs := range results {
		if cs.Revenue > maxRev {
			maxRev = cs.Revenue
			topCat = cs.Category
		}
	}

	return c.JSON(AnalyticsResponse{
		Data:      results,
		Insight:   fmt.Sprintf("Top selling category: %s (₹%.2f)", topCat, maxRev),
		Decision:  fmt.Sprintf("Increase stock in %s category - highest demand", topCat),
		AlertType: "success",
	})
}

// ─────────────────────────────────────────────
// ANALYTICS: DAILY TRENDS
// ─────────────────────────────────────────────
func handleTrends(c *fiber.Ctx) error {
	storeID := parseStoreID(c)
	dbs := getStoreDBs(storeID)
	ids := getStoreIDs(storeID)
	days := c.Query("days", "30")

	trendMap := make(map[string]*DailyTrend)

	for i, db := range dbs {
		sid := ids[i]
		rows, err := db.Query(fmt.Sprintf(`
			SELECT DATE_FORMAT(order_date,'%%Y-%%m-%%d'), SUM(total_amount), COUNT(*)
			FROM orders WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL %s DAY)
			GROUP BY DATE_FORMAT(order_date,'%%Y-%%m-%%d') ORDER BY 1`, days))
		if err != nil {
			continue
		}
		defer rows.Close()

		for rows.Next() {
			var dt DailyTrend
			rows.Scan(&dt.Date, &dt.Revenue, &dt.Orders)
			dt.StoreID = sid
			dt.Revenue = round2(dt.Revenue)

			key := dt.Date
			if storeID == 0 {
				if existing, ok := trendMap[key]; ok {
					existing.Revenue += dt.Revenue
					existing.Orders += dt.Orders
				} else {
					d2 := dt
					trendMap[key] = &d2
				}
			} else {
				trendMap[key] = &dt
			}
		}
	}

	var results []DailyTrend
	for _, dt := range trendMap {
		results = append(results, *dt)
	}

	return c.JSON(AnalyticsResponse{
		Data:      results,
		Insight:   fmt.Sprintf("Last %s days trend data across %d stores", days, len(dbs)),
		Decision:  "Identify peak sales days for targeted promotions",
		AlertType: "info",
	})
}

// ─────────────────────────────────────────────
// ANALYTICS: CUSTOMERS
// ─────────────────────────────────────────────
func handleCustomers(c *fiber.Ctx) error {
	storeID := parseStoreID(c)
	dbs := getStoreDBs(storeID)
	ids := getStoreIDs(storeID)

	type CustomerAnalytics struct {
		ID        int     `json:"id"`
		Name      string  `json:"name"`
		Phone     string  `json:"phone"`
		IsRegular bool    `json:"is_regular"`
		Orders    int     `json:"orders"`
		Spent     float64 `json:"total_spent"`
		StoreID   int     `json:"store_id"`
		StoreName string  `json:"store_name"`
		Segment   string  `json:"segment"`
	}

	var customers []CustomerAnalytics

	for i, db := range dbs {
		sid := ids[i]
		rows, err := db.Query(`
			SELECT c.id, c.name, c.phone, c.is_regular, COUNT(o.id), IFNULL(SUM(o.total_amount),0)
			FROM customers c LEFT JOIN orders o ON o.customer_id=c.id
			GROUP BY c.id ORDER BY SUM(o.total_amount) DESC LIMIT 50`)
		if err != nil {
			continue
		}
		defer rows.Close()

		for rows.Next() {
			var ca CustomerAnalytics
			rows.Scan(&ca.ID, &ca.Name, &ca.Phone, &ca.IsRegular, &ca.Orders, &ca.Spent)
			ca.StoreID = sid
			ca.StoreName = storeName(sid)
			ca.Spent = round2(ca.Spent)
			if ca.Spent > 5000 {
				ca.Segment = "VIP"
			} else if ca.IsRegular {
				ca.Segment = "Regular"
			} else {
				ca.Segment = "Occasional"
			}
			customers = append(customers, ca)
		}
	}

	return c.JSON(AnalyticsResponse{
		Data:      customers,
		Insight:   fmt.Sprintf("Analyzed %d customers", len(customers)),
		Decision:  "Target VIP customers with loyalty rewards for retention",
		AlertType: "info",
	})
}

// ─────────────────────────────────────────────
// ANALYTICS: WORKFORCE
// ─────────────────────────────────────────────
func handleWorkforce(c *fiber.Ctx) error {
	storeID := parseStoreID(c)
	dbs := getStoreDBs(storeID)
	ids := getStoreIDs(storeID)

	var stats []AttendanceStat
	absentToday := 0

	for i, db := range dbs {
		sid := ids[i]
		rows, err := db.Query(`
			SELECT w.id, w.name, w.phone, w.role, w.store_id,
			SUM(a.status='present'), SUM(a.status='absent'), SUM(a.status='leave')
			FROM workers w LEFT JOIN attendance a ON a.worker_id=w.id
			WHERE a.date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
			GROUP BY w.id ORDER BY SUM(a.status='absent') DESC`)
		if err != nil {
			continue
		}
		defer rows.Close()

		for rows.Next() {
			var as AttendanceStat
			rows.Scan(&as.WorkerID, &as.WorkerName, &as.Phone, &as.Role, &as.StoreID,
				&as.Present, &as.Absent, &as.Leave)
			total := as.Present + as.Absent + as.Leave
			if total > 0 {
				as.Rate = round2(float64(as.Present) / float64(total) * 100)
			}
			_ = sid
			stats = append(stats, as)
		}

		// Count absent today
		var abs int
		db.QueryRow("SELECT COUNT(*) FROM attendance WHERE date=CURDATE() AND status='absent'").Scan(&abs)
		absentToday += abs
	}

	decision := "Workforce attendance is good"
	alertType := "success"
	if absentToday > 5 {
		decision = fmt.Sprintf("⚠️ %d workers absent today - arrange backup staff", absentToday)
		alertType = "warning"
	}

	return c.JSON(AnalyticsResponse{
		Data:      stats,
		Insight:   fmt.Sprintf("%d total workers analyzed, %d absent today", len(stats), absentToday),
		Decision:  decision,
		AlertType: alertType,
	})
}

// ─────────────────────────────────────────────
// ANALYTICS: FINANCE
// ─────────────────────────────────────────────
func handleFinance(c *fiber.Ctx) error {
	storeID := parseStoreID(c)
	dbs := getStoreDBs(storeID)
	ids := getStoreIDs(storeID)

	type FinanceSummary struct {
		StoreID      int     `json:"store_id"`
		StoreName    string  `json:"store_name"`
		TotalSalary  float64 `json:"total_salary"`
		TotalBonus   float64 `json:"total_bonus"`
		TotalAds     float64 `json:"total_ads"`
		TotalEMI     float64 `json:"total_emi"`
		TotalLoan    float64 `json:"total_loan"`
		Revenue      float64 `json:"revenue"`
		NetProfit    float64 `json:"net_profit"`
	}

	var results []FinanceSummary

	for i, db := range dbs {
		sid := ids[i]
		fs := FinanceSummary{StoreID: sid, StoreName: storeName(sid)}

		var sal, bonus, ads, emi, loan, rev sql.NullFloat64
		db.QueryRow("SELECT SUM(basic_salary), SUM(bonus) FROM salaries WHERE month LIKE '%2025%'").Scan(&sal, &bonus)
		db.QueryRow("SELECT SUM(amount) FROM advertisements WHERE month LIKE '%2025%'").Scan(&ads)
		db.QueryRow("SELECT SUM(emi_amount) FROM loans WHERE status='active'").Scan(&emi)
		db.QueryRow("SELECT SUM(remaining_balance) FROM loans").Scan(&loan)
		db.QueryRow("SELECT SUM(total_amount) FROM orders").Scan(&rev)

		fs.TotalSalary = round2(nullableFloat(sal))
		fs.TotalBonus = round2(nullableFloat(bonus))
		fs.TotalAds = round2(nullableFloat(ads))
		fs.TotalEMI = round2(nullableFloat(emi))
		fs.TotalLoan = round2(nullableFloat(loan))
		fs.Revenue = round2(nullableFloat(rev))
		fs.NetProfit = round2(fs.Revenue - fs.TotalSalary - fs.TotalAds - fs.TotalEMI)

		results = append(results, fs)
	}

	totalEMI := 0.0
	totalProfit := 0.0
	for _, r := range results {
		totalEMI += r.TotalEMI
		totalProfit += r.NetProfit
	}

	decision := "Financial performance is stable"
	alertType := "success"
	if totalEMI > totalProfit*0.3 {
		decision = fmt.Sprintf("⚠️ EMI (₹%.2f/month) is >30%% of profit - reduce expenses", totalEMI)
		alertType = "warning"
	}

	return c.JSON(AnalyticsResponse{
		Data:      results,
		Insight:   fmt.Sprintf("Total monthly EMI: ₹%.2f | Net profit: ₹%.2f", totalEMI, totalProfit),
		Decision:  decision,
		AlertType: alertType,
	})
}

// ─────────────────────────────────────────────
// ANALYTICS: EXPIRY
// ─────────────────────────────────────────────
func handleExpiry(c *fiber.Ctx) error {
	storeID := parseStoreID(c)
	days := c.Query("days", "7")
	dbs := getStoreDBs(storeID)
	ids := getStoreIDs(storeID)

	var products []Product

	for i, db := range dbs {
		sid := ids[i]
		rows, err := db.Query(fmt.Sprintf(`
			SELECT id, name, category, price, cost_price, stock, 
			IFNULL(DATE_FORMAT(expiry_date,'%%Y-%%m-%%d'),''), store_id,
			DATEDIFF(expiry_date, CURDATE())
			FROM products 
			WHERE expiry_date <= DATE_ADD(CURDATE(), INTERVAL %s DAY) AND stock > 0
			ORDER BY expiry_date ASC`, days))
		if err != nil {
			continue
		}
		defer rows.Close()

		for rows.Next() {
			var p Product
			rows.Scan(&p.ID, &p.Name, &p.Category, &p.Price, &p.CostPrice,
				&p.Stock, &p.ExpiryDate, &p.StoreID, &p.DaysToExp)
			p.StoreID = sid
			p.StoreName = storeName(sid)
			p.Profit = round2(p.Price - p.CostPrice)
			products = append(products, p)
		}
	}

	insight := fmt.Sprintf("%d products expiring within %s days", len(products), days)
	decision := "No urgent expiry issues"
	alertType := "success"

	if len(products) > 0 {
		totalLoss := 0.0
		for _, p := range products {
			totalLoss += p.CostPrice * float64(p.Stock)
		}
		decision = fmt.Sprintf("Apply 20-50%% discount on expiring items to save ₹%.2f potential loss", totalLoss)
		alertType = "warning"
		if len(products) > 10 {
			alertType = "danger"
		}
	}

	return c.JSON(AnalyticsResponse{
		Data:      products,
		Insight:   insight,
		Decision:  decision,
		AlertType: alertType,
	})
}

// ─────────────────────────────────────────────
// ANALYTICS: UNSOLD
// ─────────────────────────────────────────────
func handleUnsold(c *fiber.Ctx) error {
	storeID := parseStoreID(c)
	dbs := getStoreDBs(storeID)
	ids := getStoreIDs(storeID)

	type UnsoldProduct struct {
		ProductID  int     `json:"product_id"`
		Name       string  `json:"name"`
		Category   string  `json:"category"`
		Stock      int     `json:"stock"`
		Price      float64 `json:"price"`
		LastSold   string  `json:"last_sold"`
		DaysUnsold int     `json:"days_unsold"`
		StoreID    int     `json:"store_id"`
		StoreName  string  `json:"store_name"`
		Suggestion string  `json:"suggestion"`
	}

	var results []UnsoldProduct

	for i, db := range dbs {
		sid := ids[i]
		rows, err := db.Query(`
			SELECT p.id, p.name, p.category, p.stock, p.price,
			IFNULL(DATE_FORMAT(MAX(o.order_date),'%Y-%m-%d'),'Never'),
			IFNULL(DATEDIFF(CURDATE(), MAX(o.order_date)), 999)
			FROM products p
			LEFT JOIN order_items oi ON oi.product_id=p.id
			LEFT JOIN orders o ON o.id=oi.order_id
			WHERE p.stock > 0
			GROUP BY p.id
			HAVING IFNULL(DATEDIFF(CURDATE(), MAX(o.order_date)), 999) > 5
			ORDER BY 7 DESC LIMIT 30`)
		if err != nil {
			continue
		}
		defer rows.Close()

		for rows.Next() {
			var up UnsoldProduct
			rows.Scan(&up.ProductID, &up.Name, &up.Category, &up.Stock, &up.Price, &up.LastSold, &up.DaysUnsold)
			up.StoreID = sid
			up.StoreName = storeName(sid)
			if up.DaysUnsold > 30 {
				up.Suggestion = "Apply 50% discount immediately"
			} else if up.DaysUnsold > 14 {
				up.Suggestion = "Feature in promotions - 30% discount"
			} else {
				up.Suggestion = "Monitor closely - 10% discount"
			}
			results = append(results, up)
		}
	}

	decision := "No slow-moving products detected"
	alertType := "success"
	if len(results) > 10 {
		decision = fmt.Sprintf("⚠️ %d products unsold for 5+ days - apply discounts to clear inventory", len(results))
		alertType = "warning"
	}

	return c.JSON(AnalyticsResponse{
		Data:      results,
		Insight:   fmt.Sprintf("%d slow-moving products identified", len(results)),
		Decision:  decision,
		AlertType: alertType,
	})
}

// ─────────────────────────────────────────────
// ANALYTICS: TOP PRODUCTS
// ─────────────────────────────────────────────
func handleTopProducts(c *fiber.Ctx) error {
	storeID := parseStoreID(c)
	topN := c.Query("top", "10")
	dbs := getStoreDBs(storeID)
	ids := getStoreIDs(storeID)

	prodMap := make(map[string]*ProductSales)

	for i, db := range dbs {
		sid := ids[i]
		rows, err := db.Query(fmt.Sprintf(`
			SELECT p.id, p.name, p.category, SUM(oi.quantity), SUM(oi.quantity*oi.unit_price)
			FROM order_items oi JOIN products p ON p.id=oi.product_id
			GROUP BY p.id ORDER BY SUM(oi.quantity) DESC LIMIT %s`, topN))
		if err != nil {
			continue
		}
		defer rows.Close()

		for rows.Next() {
			var ps ProductSales
			rows.Scan(&ps.ProductID, &ps.Name, &ps.Category, &ps.Quantity, &ps.Revenue)
			ps.StoreID = sid
			ps.Revenue = round2(ps.Revenue)

			key := ps.Name
			if storeID == 0 {
				if ex, ok := prodMap[key]; ok {
					ex.Quantity += ps.Quantity
					ex.Revenue += ps.Revenue
				} else {
					p2 := ps
					prodMap[key] = &p2
				}
			} else {
				prodMap[key] = &ps
			}
		}
	}

	var results []ProductSales
	for _, ps := range prodMap {
		results = append(results, *ps)
	}

	return c.JSON(AnalyticsResponse{
		Data:      results,
		Insight:   fmt.Sprintf("Top %s selling products analyzed", topN),
		Decision:  "Ensure adequate stock for top-selling products",
		AlertType: "success",
	})
}

// ─────────────────────────────────────────────
// ANALYTICS: AI DECISIONS
// ─────────────────────────────────────────────
func handleAIDecisions(c *fiber.Ctx) error {
	storeID := parseStoreID(c)

	// Generate fresh AI decisions
	decisions := generateAIDecisions(storeID)

	// Save to master
	if master != nil {
		for _, d := range decisions {
			master.Exec(`INSERT INTO ai_decisions (store_id, category, message, decision_type, alert_type) 
				VALUES (?,?,?,?,?)`, d.StoreID, d.Category, d.Message, d.DecisionType, d.AlertType)
		}
	}

	// Fetch from master
	var allDecisions []AIDecision
	if master != nil {
		query := "SELECT id, store_id, category, message, decision_type, alert_type, DATE_FORMAT(created_at,'%Y-%m-%d %H:%i') FROM ai_decisions ORDER BY created_at DESC LIMIT 50"
		if storeID > 0 {
			query = fmt.Sprintf("SELECT id, store_id, category, message, decision_type, alert_type, DATE_FORMAT(created_at,'%%Y-%%m-%%d %%H:%%i') FROM ai_decisions WHERE store_id IN (0,%d) ORDER BY created_at DESC LIMIT 50", storeID)
		}
		rows, err := master.Query(query)
		if err == nil {
			defer rows.Close()
			for rows.Next() {
				var ad AIDecision
				rows.Scan(&ad.ID, &ad.StoreID, &ad.Category, &ad.Message, &ad.DecisionType, &ad.AlertType, &ad.CreatedAt)
				allDecisions = append(allDecisions, ad)
			}
		}
	}

	if allDecisions == nil {
		allDecisions = decisions
	}

	return c.JSON(AnalyticsResponse{
		Data:      allDecisions,
		Insight:   fmt.Sprintf("%d AI decisions generated", len(allDecisions)),
		Decision:  "AI engine analyzed all stores and generated action items",
		AlertType: "info",
	})
}

func generateAIDecisions(storeID int) []AIDecision {
	dbs := getStoreDBs(storeID)
	ids := getStoreIDs(storeID)
	var decisions []AIDecision

	for i, db := range dbs {
		sid := ids[i]

		// Check expiry
		rows, _ := db.Query(`SELECT name, stock, DATEDIFF(expiry_date, CURDATE()) FROM products 
			WHERE expiry_date <= DATE_ADD(CURDATE(), INTERVAL 3 DAY) AND stock > 0 LIMIT 5`)
		if rows != nil {
			defer rows.Close()
			for rows.Next() {
				var name string
				var stock, days int
				rows.Scan(&name, &stock, &days)
				msg := fmt.Sprintf("%s expiring in %d day(s) at %s (stock: %d) → Apply 30%% discount immediately", name, days, storeName(sid), stock)
				decisions = append(decisions, AIDecision{StoreID: sid, Category: "Expiry", Message: msg, DecisionType: "expiry", AlertType: "warning"})
			}
		}

		// Check low stock
		rows2, _ := db.Query("SELECT name, stock FROM products WHERE stock < 5 AND stock > 0 LIMIT 5")
		if rows2 != nil {
			defer rows2.Close()
			for rows2.Next() {
				var name string
				var stock int
				rows2.Scan(&name, &stock)
				msg := fmt.Sprintf("%s critically low (%d units) at %s → Reorder now", name, stock, storeName(sid))
				decisions = append(decisions, AIDecision{StoreID: sid, Category: "Stock", Message: msg, DecisionType: "stock", AlertType: "danger"})
			}
		}

		// Check out of stock
		rows3, _ := db.Query("SELECT name FROM products WHERE stock = 0 LIMIT 3")
		if rows3 != nil {
			defer rows3.Close()
			for rows3.Next() {
				var name string
				rows3.Scan(&name)
				msg := fmt.Sprintf("%s OUT OF STOCK at %s → Transfer from other store or place emergency order", name, storeName(sid))
				decisions = append(decisions, AIDecision{StoreID: sid, Category: "Stock", Message: msg, DecisionType: "outofstock", AlertType: "danger"})
			}
		}

		// Check absent workers
		var absentCount int
		db.QueryRow("SELECT COUNT(*) FROM attendance WHERE date=CURDATE() AND status='absent'").Scan(&absentCount)
		if absentCount > 3 {
			msg := fmt.Sprintf("%d workers absent at %s → Assign backup staff or adjust shifts", absentCount, storeName(sid))
			decisions = append(decisions, AIDecision{StoreID: sid, Category: "Workforce", Message: msg, DecisionType: "workforce", AlertType: "warning"})
		}

		// Check EMI vs revenue
		var emi, rev sql.NullFloat64
		db.QueryRow("SELECT SUM(emi_amount) FROM loans WHERE status='active'").Scan(&emi)
		db.QueryRow("SELECT SUM(total_amount) FROM orders WHERE order_date >= DATE_SUB(NOW(), INTERVAL 30 DAY)").Scan(&rev)
		if nullableFloat(rev) > 0 && nullableFloat(emi)/nullableFloat(rev)*100 > 20 {
			msg := fmt.Sprintf("EMI (₹%.2f/month) is %.2f%% of monthly revenue at %s → Review loan strategy", nullableFloat(emi), nullableFloat(emi)/nullableFloat(rev)*100, storeName(sid))
			decisions = append(decisions, AIDecision{StoreID: sid, Category: "Finance", Message: msg, DecisionType: "finance", AlertType: "warning"})
		}

		// Demand prediction
		rows4, _ := db.Query(`
			SELECT p.name, SUM(oi.quantity)/7 as daily_avg
			FROM order_items oi JOIN products p ON p.id=oi.product_id
			JOIN orders o ON o.id=oi.order_id
			WHERE o.order_date >= DATE_SUB(NOW(), INTERVAL 7 DAY)
			GROUP BY p.id HAVING daily_avg > 10
			ORDER BY daily_avg DESC LIMIT 3`)
		if rows4 != nil {
			defer rows4.Close()
			for rows4.Next() {
				var name string
				var avg float64
				rows4.Scan(&name, &avg)
				msg := fmt.Sprintf("High demand: %s averaging %.0f units/day at %s → Increase stock by 50%%", name, avg, storeName(sid))
				decisions = append(decisions, AIDecision{StoreID: sid, Category: "Demand", Message: msg, DecisionType: "demand", AlertType: "success"})
			}
		}
	}

	return decisions
}

// ─────────────────────────────────────────────
// ANALYTICS: STORE COMPARISON
// ─────────────────────────────────────────────
func handleStoreCompare(c *fiber.Ctx) error {
	type StoreComparison struct {
		StoreID      int     `json:"store_id"`
		StoreName    string  `json:"store_name"`
		Revenue      float64 `json:"revenue"`
		Orders       int     `json:"orders"`
		Products     int     `json:"products"`
		LowStock     int     `json:"low_stock"`
		OutOfStock   int     `json:"out_of_stock"`
		Expiring     int     `json:"expiring"`
		Workers      int     `json:"workers"`
		Attendance   float64 `json:"attendance_rate"`
		TotalSalary  float64 `json:"total_salary"`
		Profit       float64 `json:"profit"`
		HealthScore  float64 `json:"health_score"`
	}

	dbs := []*sql.DB{db1, db2, db3}
	var results []StoreComparison

	for i, db := range dbs {
		if db == nil {
			continue
		}
		sid := i + 1
		sc := StoreComparison{StoreID: sid, StoreName: storeName(sid)}

		var rev, profit, salary sql.NullFloat64
		db.QueryRow("SELECT SUM(total_amount), COUNT(*) FROM orders").Scan(&rev, &sc.Orders)
		db.QueryRow(`SELECT SUM((p.price-p.cost_price)*oi.quantity) FROM order_items oi JOIN products p ON p.id=oi.product_id`).Scan(&profit)
		db.QueryRow("SELECT COUNT(*), SUM(stock<5 AND stock>0), SUM(stock=0), SUM(expiry_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(),INTERVAL 3 DAY)) FROM products").
			Scan(&sc.Products, &sc.LowStock, &sc.OutOfStock, &sc.Expiring)
		db.QueryRow("SELECT COUNT(*) FROM workers").Scan(&sc.Workers)
		db.QueryRow("SELECT IFNULL(SUM(status='present')/COUNT(*)*100,0) FROM attendance WHERE date>=DATE_SUB(CURDATE(),INTERVAL 30 DAY)").Scan(&sc.Attendance)
		db.QueryRow("SELECT SUM(total_salary) FROM salaries WHERE month LIKE '%2025%'").Scan(&salary)

		sc.Revenue = round2(nullableFloat(rev))
		sc.Profit = round2(nullableFloat(profit))
		sc.TotalSalary = round2(nullableFloat(salary))
		sc.Attendance = round2(sc.Attendance)

		health := 100.0 - float64(sc.LowStock)*0.5 - float64(sc.OutOfStock)*2 - float64(sc.Expiring)
		if health < 0 {
			health = 0
		}
		sc.HealthScore = round2(health)
		results = append(results, sc)
	}

	bestStore := ""
	maxRev := 0.0
	for _, r := range results {
		if r.Revenue > maxRev {
			maxRev = r.Revenue
			bestStore = r.StoreName
		}
	}

	return c.JSON(AnalyticsResponse{
		Data:      results,
		Insight:   fmt.Sprintf("Best performing store: %s with ₹%.2f revenue", bestStore, maxRev),
		Decision:  "Share best practices from top-performing store with others",
		AlertType: "success",
	})
}

// ─────────────────────────────────────────────
// SALARY
// ─────────────────────────────────────────────
func handleSalary(c *fiber.Ctx) error {
	storeID := parseStoreID(c)
	dbs := getStoreDBs(storeID)
	ids := getStoreIDs(storeID)

	var results []SalaryReport

	for i, db := range dbs {
		if db == nil {
			continue
		}
		sid := ids[i]
		rows, err := db.Query(`
			SELECT 
				w.name, 
				w.role, 
				IFNULL(s.basic_salary, w.salary) as basic_salary, 
				IFNULL(s.bonus, ROUND(w.salary * 0.1, 0)) as bonus, 
				IFNULL(s.total_salary, ROUND(w.salary * 1.1, 0)) as total_salary, 
				IFNULL(s.month, 'April-2025') as month
			FROM workers w 
			LEFT JOIN salaries s ON w.id = s.worker_id
			ORDER BY total_salary DESC`)
		if err != nil {
			log.Printf("⚠️ Error querying salaries for store %d: %v", sid, err)
			continue
		}

		for rows.Next() {
			var sr SalaryReport
			var basic, bonus, total sql.NullFloat64
			var month sql.NullString

			if err := rows.Scan(&sr.WorkerName, &sr.Role, &basic, &bonus, &total, &month); err != nil {
				log.Printf("⚠️ Error scanning salary row: %v", err)
				continue
			}

			sr.BasicSalary = round2(nullableFloat(basic))
			sr.Bonus = round2(nullableFloat(bonus))
			sr.Total = round2(nullableFloat(total))
			if sr.Total == 0 && sr.BasicSalary > 0 {
				sr.Total = sr.BasicSalary + sr.Bonus
			}
			sr.Month = nullableStr(month)
			sr.StoreID = sid
			results = append(results, sr)
		}
		rows.Close()
	}

	return c.JSON(AnalyticsResponse{
		Data:      results,
		Insight:   fmt.Sprintf("%d salary records retrieved", len(results)),
		Decision:  "Review bonus allocation based on performance metrics",
		AlertType: "info",
	})
}

// ─────────────────────────────────────────────
// LOANS
// ─────────────────────────────────────────────
func handleLoans(c *fiber.Ctx) error {
	storeID := parseStoreID(c)
	dbs := getStoreDBs(storeID)
	ids := getStoreIDs(storeID)

	var loans []Loan

	for i, db := range dbs {
		sid := ids[i]
		rows, err := db.Query(`SELECT id, store_id, total_loan, interest_rate, emi_amount, 
			remaining_balance, IFNULL(DATE_FORMAT(start_date,'%Y-%m-%d'),''),
			IFNULL(DATE_FORMAT(end_date,'%Y-%m-%d'),''), IFNULL(lender,''), IFNULL(status,'active') 
			FROM loans`)
		if err != nil {
			continue
		}
		defer rows.Close()

		for rows.Next() {
			var l Loan
			rows.Scan(&l.ID, &l.StoreID, &l.TotalLoan, &l.InterestRate, &l.EmiAmount,
				&l.RemainingBalance, &l.StartDate, &l.EndDate, &l.Lender, &l.Status)
			l.StoreName = storeName(sid)
			loans = append(loans, l)
		}
	}

	totalEMI := 0.0
	totalRemaining := 0.0
	for _, l := range loans {
		totalEMI += l.EmiAmount
		totalRemaining += l.RemainingBalance
	}

	decision := fmt.Sprintf("Total monthly EMI: ₹%.2f | Total remaining: ₹%.2f", totalEMI, totalRemaining)
	alertType := "info"
	if totalEMI > 30000 {
		alertType = "warning"
		decision += " ⚠️ - High EMI burden, consider refinancing"
	}

	return c.JSON(AnalyticsResponse{
		Data:      loans,
		Insight:   decision,
		Decision:  "Prioritize loan repayment when revenue is high",
		AlertType: alertType,
	})
}

// ─────────────────────────────────────────────
// ADVERTISEMENTS
// ─────────────────────────────────────────────
func handleAds(c *fiber.Ctx) error {
	storeID := parseStoreID(c)
	dbs := getStoreDBs(storeID)
	ids := getStoreIDs(storeID)

	var ads []Advertisement

	for i, db := range dbs {
		sid := ids[i]
		rows, err := db.Query(`SELECT id, store_id, type, amount, month, IFNULL(platform,''), 
			IFNULL(impressions,0), IFNULL(conversions,0) FROM advertisements ORDER BY date DESC`)
		if err != nil {
			continue
		}
		defer rows.Close()

		for rows.Next() {
			var ad Advertisement
			rows.Scan(&ad.ID, &ad.StoreID, &ad.Type, &ad.Amount, &ad.Month,
				&ad.Platform, &ad.Impressions, &ad.Conversions)
			ad.StoreName = storeName(sid)
			if ad.Impressions > 0 && ad.Amount > 0 {
				ad.ROI = round2(float64(ad.Conversions) / ad.Amount * 100)
			}
			ads = append(ads, ad)
		}
	}

	bestPlatform := ""
	bestROI := 0.0
	for _, ad := range ads {
		if ad.ROI > bestROI {
			bestROI = ad.ROI
			bestPlatform = ad.Platform
		}
	}

	return c.JSON(AnalyticsResponse{
		Data:      ads,
		Insight:   fmt.Sprintf("Best ROI platform: %s (%.2f%%)", bestPlatform, bestROI),
		Decision:  fmt.Sprintf("Increase budget for %s ads - highest conversion rate", bestPlatform),
		AlertType: "success",
	})
}

// ─────────────────────────────────────────────
// DEMAND PREDICTION
// ─────────────────────────────────────────────
func handleDemandPrediction(c *fiber.Ctx) error {
	storeID := parseStoreID(c)
	dbs := getStoreDBs(storeID)
	ids := getStoreIDs(storeID)

	type DemandPrediction struct {
		ProductID     int     `json:"product_id"`
		Name          string  `json:"name"`
		Category      string  `json:"category"`
		AvgDailySales float64 `json:"avg_daily_sales"`
		Stock         int     `json:"stock"`
		DaysOfStock   float64 `json:"days_of_stock"`
		StoreID       int     `json:"store_id"`
		StoreName     string  `json:"store_name"`
		Status        string  `json:"status"`
		ReorderQty    int     `json:"reorder_quantity"`
	}

	var predictions []DemandPrediction

	for i, db := range dbs {
		sid := ids[i]
		rows, err := db.Query(`
			SELECT p.id, p.name, p.category, p.stock,
			IFNULL(SUM(oi.quantity)/7, 0) as avg_daily
			FROM products p
			LEFT JOIN order_items oi ON oi.product_id=p.id
			LEFT JOIN orders o ON o.id=oi.order_id AND o.order_date >= DATE_SUB(NOW(), INTERVAL 7 DAY)
			GROUP BY p.id
			HAVING avg_daily > 0
			ORDER BY avg_daily DESC LIMIT 20`)
		if err != nil {
			continue
		}
		defer rows.Close()

		for rows.Next() {
			var dp DemandPrediction
			rows.Scan(&dp.ProductID, &dp.Name, &dp.Category, &dp.Stock, &dp.AvgDailySales)
			dp.StoreID = sid
			dp.StoreName = storeName(sid)
			dp.AvgDailySales = round2(dp.AvgDailySales)
			if dp.AvgDailySales > 0 {
				dp.DaysOfStock = round2(float64(dp.Stock) / dp.AvgDailySales)
			}
			if dp.DaysOfStock < 3 {
				dp.Status = "Critical"
				dp.ReorderQty = int(dp.AvgDailySales * 30)
			} else if dp.DaysOfStock < 7 {
				dp.Status = "Low"
				dp.ReorderQty = int(dp.AvgDailySales * 20)
			} else {
				dp.Status = "OK"
				dp.ReorderQty = int(dp.AvgDailySales * 10)
			}
			predictions = append(predictions, dp)
		}
	}

	return c.JSON(AnalyticsResponse{
		Data:      predictions,
		Insight:   fmt.Sprintf("Demand prediction based on last 7 days for %d products", len(predictions)),
		Decision:  "Auto-reorder triggered for critical items",
		AlertType: "info",
	})
}

// ─────────────────────────────────────────────
// ALERTS
// ─────────────────────────────────────────────
func handleAlerts(c *fiber.Ctx) error {
	storeID := parseStoreID(c)
	generateStockAlerts()

	query := `SELECT id, store_id, alert_type, title, message, is_read, 
		DATE_FORMAT(created_at,'%Y-%m-%d %H:%i:%s') FROM system_alerts ORDER BY created_at DESC LIMIT 50`
	if storeID > 0 {
		query = fmt.Sprintf(`SELECT id, store_id, alert_type, title, message, is_read, 
			DATE_FORMAT(created_at,'%%Y-%%m-%%d %%H:%%i:%%s') FROM system_alerts 
			WHERE store_id IN (0,%d) ORDER BY created_at DESC LIMIT 50`, storeID)
	}

	var alerts []Alert
	if master != nil {
		rows, err := master.Query(query)
		if err == nil {
			defer rows.Close()
			for rows.Next() {
				var a Alert
				rows.Scan(&a.ID, &a.StoreID, &a.AlertType, &a.Title, &a.Message, &a.IsRead, &a.CreatedAt)
				alerts = append(alerts, a)
			}
		}
	}

	return c.JSON(AnalyticsResponse{
		Data:      alerts,
		Insight:   fmt.Sprintf("%d alerts found", len(alerts)),
		Decision:  "Address danger alerts immediately",
		AlertType: "info",
	})
}

func handleMarkAlertRead(c *fiber.Ctx) error {
	id := c.Params("id")
	if master != nil {
		master.Exec("UPDATE system_alerts SET is_read=1 WHERE id=?", id)
	}
	return c.JSON(fiber.Map{"message": "Alert marked as read"})
}

func generateStockAlerts() {
	if master == nil {
		return
	}
	dbs := []*sql.DB{db1, db2, db3}
	for i, db := range dbs {
		if db == nil {
			continue
		}
		sid := i + 1

		// Low stock
		rows, err := db.Query("SELECT name, stock FROM products WHERE stock < 5 AND stock > 0")
		if err == nil {
			defer rows.Close()
			for rows.Next() {
				var name string
				var stock int
				rows.Scan(&name, &stock)
				master.Exec(`INSERT INTO system_alerts (store_id, alert_type, title, message) 
					SELECT ?,?,?,? WHERE NOT EXISTS (
						SELECT 1 FROM system_alerts WHERE store_id=? AND title=? AND created_at>DATE_SUB(NOW(), INTERVAL 1 HOUR))`,
					sid, "warning", "Low Stock: "+name,
					fmt.Sprintf("%s has only %d units at %s", name, stock, storeName(sid)),
					sid, "Low Stock: "+name)
			}
		}

		// Out of stock
		rows2, err := db.Query("SELECT name FROM products WHERE stock = 0")
		if err == nil {
			defer rows2.Close()
			for rows2.Next() {
				var name string
				rows2.Scan(&name)
				master.Exec(`INSERT INTO system_alerts (store_id, alert_type, title, message)
					SELECT ?,?,?,? WHERE NOT EXISTS (
						SELECT 1 FROM system_alerts WHERE store_id=? AND title=? AND created_at>DATE_SUB(NOW(), INTERVAL 1 HOUR))`,
					sid, "danger", "Out of Stock: "+name,
					fmt.Sprintf("%s is OUT OF STOCK at %s", name, storeName(sid)),
					sid, "Out of Stock: "+name)
			}
		}
	}
}

// ─────────────────────────────────────────────
// WORKERS
// ─────────────────────────────────────────────
func handleWorkers(c *fiber.Ctx) error {
	storeID := parseStoreID(c)
	dbs := getStoreDBs(storeID)
	ids := getStoreIDs(storeID)

	var workers []Worker

	for i, db := range dbs {
		sid := ids[i]
		rows, err := db.Query("SELECT id, name, phone, role, store_id, salary FROM workers ORDER BY role")
		if err != nil {
			continue
		}
		defer rows.Close()

		for rows.Next() {
			var w Worker
			rows.Scan(&w.ID, &w.Name, &w.Phone, &w.Role, &w.StoreID, &w.Salary)
			w.Store = storeName(sid)
			workers = append(workers, w)
		}
	}

	return c.JSON(AnalyticsResponse{
		Data:      workers,
		Insight:   fmt.Sprintf("%d workers across %d stores", len(workers), len(dbs)),
		Decision:  "Optimize workforce allocation based on daily needs",
		AlertType: "info",
	})
}

// ─────────────────────────────────────────────
// ATTENDANCE
// ─────────────────────────────────────────────
func handleAttendance(c *fiber.Ctx) error {
	storeID := parseStoreID(c)
	dbs := getStoreDBs(storeID)
	ids := getStoreIDs(storeID)

	var stats []AttendanceStat

	for i, db := range dbs {
		sid := ids[i]
		rows, err := db.Query(`
			SELECT w.id, w.name, w.phone, w.role, w.store_id,
			SUM(a.status='present'), SUM(a.status='absent'), SUM(a.status='leave')
			FROM workers w LEFT JOIN attendance a ON a.worker_id=w.id
			WHERE a.date=CURDATE()
			GROUP BY w.id ORDER BY w.name`)
		if err != nil {
			continue
		}
		defer rows.Close()

		for rows.Next() {
			var as AttendanceStat
			rows.Scan(&as.WorkerID, &as.WorkerName, &as.Phone, &as.Role, &as.StoreID,
				&as.Present, &as.Absent, &as.Leave)
			total := as.Present + as.Absent + as.Leave
			if total > 0 {
				as.Rate = round2(float64(as.Present) / float64(total) * 100)
			}
			_ = sid
			stats = append(stats, as)
		}
	}

	return c.JSON(AnalyticsResponse{
		Data:      stats,
		Insight:   fmt.Sprintf("Today's attendance for %d workers", len(stats)),
		Decision:  "Monitor absent workers and arrange coverage",
		AlertType: "info",
	})
}

// ─────────────────────────────────────────────
// SIMULATE
// ─────────────────────────────────────────────
func handleSimulate(c *fiber.Ctx) error {
	type SimReq struct {
		Type    string `json:"type"`
		StoreID int    `json:"store_id"`
	}
	var req SimReq
	c.BodyParser(&req)

	results := []string{}

	switch req.Type {
	case "heavy_sales":
		dbs := getStoreDBs(req.StoreID)
		ids := getStoreIDs(req.StoreID)
		for i, db := range dbs {
			sid := ids[i]
			// Place 10 random orders
			for j := 0; j < 10; j++ {
				custID := rand.Intn(100) + 1
				total := rand.Float64()*2000 + 200
				db.Exec("INSERT INTO orders (customer_id, total_amount, order_type, order_date) VALUES (?,?,?,NOW())",
					custID, round2(total), "store")

				// Reduce random product stock
				prodID := rand.Intn(90) + 1
				qty := rand.Intn(5) + 1
				db.Exec("UPDATE products SET stock=GREATEST(0, stock-?) WHERE id=?", qty, prodID)
			}
			results = append(results, fmt.Sprintf("%s: 10 orders simulated", storeName(sid)))
		}

	case "worker_absence":
		dbs := getStoreDBs(req.StoreID)
		ids := getStoreIDs(req.StoreID)
		for i, db := range dbs {
			sid := ids[i]
			// Mark 5 random workers absent
			db.Exec(`UPDATE attendance SET status='absent' 
				WHERE date=CURDATE() AND worker_id IN 
				(SELECT id FROM workers WHERE store_id=? ORDER BY RAND() LIMIT 5)`, sid)
			results = append(results, fmt.Sprintf("%s: 5 workers marked absent", storeName(sid)))
		}

	case "expiry_warning":
		dbs := getStoreDBs(req.StoreID)
		ids := getStoreIDs(req.StoreID)
		for i, db := range dbs {
			sid := ids[i]
			// Set some products to expire soon
			db.Exec("UPDATE products SET expiry_date=DATE_ADD(CURDATE(), INTERVAL 1 DAY) WHERE RAND()<0.05 AND stock>0")
			results = append(results, fmt.Sprintf("%s: expiry dates updated for simulation", storeName(sid)))
		}
	}

	return c.JSON(fiber.Map{
		"message": "Simulation completed",
		"results": results,
		"type":    req.Type,
	})
}

// ─────────────────────────────────────────────
// HEALTH CHECK
// ─────────────────────────────────────────────
func handleHealth(c *fiber.Ctx) error {
	status := map[string]interface{}{
		"status":    "healthy",
		"timestamp": time.Now().Format("2006-01-02 15:04:05"),
		"databases": map[string]string{
			"db_store1": dbStatus(db1),
			"db_store2": dbStatus(db2),
			"db_store3": dbStatus(db3),
			"db_master": dbStatus(master),
		},
	}
	return c.JSON(status)
}

func dbStatus(db *sql.DB) string {
	if db == nil {
		return "disconnected"
	}
	if err := db.Ping(); err != nil {
		return "error: " + err.Error()
	}
	return "connected"
}

// ─────────────────────────────────────────────
// CRON SCHEDULER
// ─────────────────────────────────────────────
func startScheduler() {
	c := cron.New()

	// Generate daily report at 8 PM
	c.AddFunc("0 20 * * *", func() {
		log.Println("📊 Generating daily report...")
		saveDailyReport()
	})

	// Check alerts every 5 minutes
	c.AddFunc("*/5 * * * *", func() {
		generateStockAlerts()
	})

	// Morning workforce check at 9 AM
	c.AddFunc("0 9 * * *", func() {
		log.Println("👥 Morning workforce check...")
		checkWorkforceAlerts()
	})

	c.Start()
	log.Println("⏰ Scheduler started")
}

func saveDailyReport() {
	if master == nil {
		return
	}
	dbs := []*sql.DB{db1, db2, db3}
	for i, db := range dbs {
		sid := i + 1
		var rev sql.NullFloat64
		var orders int
		db.QueryRow("SELECT SUM(total_amount), COUNT(*) FROM orders WHERE DATE(order_date)=CURDATE()").Scan(&rev, &orders)

		var profit sql.NullFloat64
		db.QueryRow(`SELECT SUM((p.price-p.cost_price)*oi.quantity) FROM order_items oi 
			JOIN products p ON p.id=oi.product_id
			JOIN orders o ON o.id=oi.order_id WHERE DATE(o.order_date)=CURDATE()`).Scan(&profit)

		master.Exec(`INSERT INTO daily_reports (report_date, store_id, total_revenue, total_orders, total_profit) 
			VALUES (CURDATE(),?,?,?,?)`, sid, nullableFloat(rev), orders, nullableFloat(profit))
	}
}

func checkWorkforceAlerts() {
	if master == nil {
		return
	}
	dbs := []*sql.DB{db1, db2, db3}
	for i, db := range dbs {
		sid := i + 1
		var absent int
		db.QueryRow("SELECT COUNT(*) FROM attendance WHERE date=CURDATE() AND status='absent'").Scan(&absent)
		if absent > 3 {
			master.Exec(`INSERT INTO system_alerts (store_id, alert_type, title, message) VALUES (?,?,?,?)`,
				sid, "warning", "Workforce Shortage",
				fmt.Sprintf("%d workers absent at %s - backup required", absent, storeName(sid)))
		}
	}
}


