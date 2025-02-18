# レイヤー図

以下のレイヤー図は、アプリケーションのアーキテクチャを示しています。

```mermaid
classDiagram
    direction TB
    class FrameworkAndDrivers {
        flutter
    }
    class InterfaceAdapter {
        golang
    }
    class UseCase {
        golang
    }
    class Entities {
        golang
    }
    FrameworkAndDrivers --> InterfaceAdapter
    InterfaceAdapter --> UseCase
    UseCase --> Entities
