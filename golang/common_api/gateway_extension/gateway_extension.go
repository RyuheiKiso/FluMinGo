package gateway_extension

// APIゲートウェイの拡張機能：トラフィック分析、セキュリティ監視、カスタムルール適用

// GatewayExtension はAPIゲートウェイの拡張機能を管理する構造体です。
type GatewayExtension struct {
	trafficAnalyzer TrafficAnalyzer
	securityMonitor SecurityMonitor
	customRules     []CustomRule
}

// TrafficAnalyzer はトラフィック分析のインターフェースを定義します。
type TrafficAnalyzer interface {
	AnalyzeTraffic(data interface{}) error
}

// SecurityMonitor はセキュリティ監視のインターフェースを定義します。
type SecurityMonitor interface {
	MonitorSecurity(data interface{}) error
}

// CustomRule はカスタムルールのインターフェースを定義します。
type CustomRule interface {
	ApplyRule(data interface{}) error
}

// NewGatewayExtension は新しいGatewayExtensionを作成します。
func NewGatewayExtension(trafficAnalyzer TrafficAnalyzer, securityMonitor SecurityMonitor, customRules []CustomRule) *GatewayExtension {
	return &GatewayExtension{
		trafficAnalyzer: trafficAnalyzer,
		securityMonitor: securityMonitor,
		customRules:     customRules,
	}
}

// AnalyzeTraffic はトラフィックを分析します。
func (ge *GatewayExtension) AnalyzeTraffic(data interface{}) error {
	return ge.trafficAnalyzer.AnalyzeTraffic(data)
}

// MonitorSecurity はセキュリティを監視します。
func (ge *GatewayExtension) MonitorSecurity(data interface{}) error {
	return ge.securityMonitor.MonitorSecurity(data)
}

// ApplyCustomRules はカスタムルールを適用します。
func (ge *GatewayExtension) ApplyCustomRules(data interface{}) error {
	for _, rule := range ge.customRules {
		if err := rule.ApplyRule(data); err != nil {
			return err
		}
	}
	return nil
}
