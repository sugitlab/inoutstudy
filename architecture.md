# ARCHITECTURE

This doc explains the architecture adopted to the in_out_recorder app.

## Design Pattern

MVVM + Repository

```mermaid
graph LR
  View --- ViewModel
  ViewModel --- Repository
  ViewModel --- Model
  Repository --- Model
  Repository --- Local_or_API
```

## Data

- StudyRecord
  - uuid
  - title
  - created date
  - updated date
  - status (done, doging, pending)
  - free tags
  - in or out
  - memo (markdown or plain text)
  - time
