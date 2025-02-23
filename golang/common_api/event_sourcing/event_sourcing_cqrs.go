package event_sourcing

// イベントソーシングとCQRSの実装

// Event はイベントのインターフェースを定義します。
type Event interface {
	EventType() string
	EventData() interface{}
}

// EventStore はイベントストアのインターフェースを定義します。
type EventStore interface {
	Save(event Event) error
	Load(aggregateID string) ([]Event, error)
}

// Command はコマンドのインターフェースを定義します。
type Command interface {
	CommandType() string
	CommandData() interface{}
}

// CommandHandler はコマンドハンドラーのインターフェースを定義します。
type CommandHandler interface {
	Handle(command Command) error
}

// EventSourcingCQRS はイベントソーシングとCQRSのメイン構造体です。
type EventSourcingCQRS struct {
	eventStore     EventStore
	commandHandler CommandHandler
}

// NewEventSourcingCQRS は新しいEventSourcingCQRSを作成します。
func NewEventSourcingCQRS(eventStore EventStore, commandHandler CommandHandler) *EventSourcingCQRS {
	return &EventSourcingCQRS{
		eventStore:     eventStore,
		commandHandler: commandHandler,
	}
}

// HandleCommand はコマンドを処理します。
func (escqrs *EventSourcingCQRS) HandleCommand(command Command) error {
	return escqrs.commandHandler.Handle(command)
}

// SaveEvent はイベントを保存します。
func (escqrs *EventSourcingCQRS) SaveEvent(event Event) error {
	return escqrs.eventStore.Save(event)
}

// LoadEvents はイベントをロードします。
func (escqrs *EventSourcingCQRS) LoadEvents(aggregateID string) ([]Event, error) {
	return escqrs.eventStore.Load(aggregateID)
}
