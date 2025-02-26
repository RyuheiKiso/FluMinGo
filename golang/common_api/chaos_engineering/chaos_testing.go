package chaos_engineering

import (
	"fmt"

	"FluMinGo/golang/common_api/common"
)

// 障害注入や混沌テストによる耐障害性検証・強化

// ChaosTest は障害注入テストのインターフェースを定義します。
type ChaosTest interface {
	InjectFault() error
}

// ChaosEngineering は混沌テストを管理する構造体です。
type ChaosEngineering struct {
	tests        []ChaosTest
	logger       common.Logger
	errorHandler common.ErrorHandler
}

// NewChaosEngineering は新しいChaosEngineeringを作成します。
func NewChaosEngineering(tests []ChaosTest, logger common.Logger, errorHandler common.ErrorHandler) *ChaosEngineering {
	return &ChaosEngineering{
		tests:        tests,
		logger:       logger,
		errorHandler: errorHandler,
	}
}

// RunTests は全ての混沌テストを実行し、詳細なログを記録します。
func (ce *ChaosEngineering) RunTests() error {
	for _, test := range ce.tests {
		ce.logger.Info(fmt.Sprintf("テスト開始: %T", test))
		if err := test.InjectFault(); err != nil {
			errMsg := ce.errorHandler.HandleError(err)
			ce.logger.Error(errMsg)
			return err
		}
		ce.logger.Info("テストが成功しました")
	}
	return nil
}

// AddTest は新しいテストを追加します。
func (ce *ChaosEngineering) AddTest(test ChaosTest) {
	ce.tests = append(ce.tests, test)
}

// RunTestByName は指定された名前のテストを実行し、詳細なログを記録します。
func (ce *ChaosEngineering) RunTestByName(name string) error {
	for _, test := range ce.tests {
		if testName, ok := test.(interface{ Name() string }); ok && testName.Name() == name {
			ce.logger.Info(fmt.Sprintf("テスト開始: %s", name))
			if err := test.InjectFault(); err != nil {
				errMsg := ce.errorHandler.HandleError(err)
				ce.logger.Error(errMsg)
				return err
			}
			ce.logger.Info("テストが成功しました")
			return nil
		}
	}
	return fmt.Errorf("テストが見つかりません: %s", name)
}

// 混沌テストの実装
