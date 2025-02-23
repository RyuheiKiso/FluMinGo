package metrics

import (
	"net/http"

	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

// Prometheus/Grafana連携によるカスタムメトリクス収集とアラート機能強化
func InitMetrics() {
	http.Handle("/metrics", promhttp.Handler())
	go http.ListenAndServe(":2112", nil)
}

var (
	RequestCount = prometheus.NewCounter(prometheus.CounterOpts{
		Name: "request_count",
		Help: "Total number of requests",
	})
)

func init() {
	prometheus.MustRegister(RequestCount)
}
