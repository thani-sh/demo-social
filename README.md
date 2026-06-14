# demo-social

A minimal microblogging web app used as a test target for the [Provar](https://provar.se) end-to-end test runner. It exposes just enough surface area — accounts, posts, likes, follows, profiles — to exercise Provar's browser, network, and assertion primitives against a real app.

The project lives next to Provar itself and is intentionally small, in-memory, and easy to throw away. It is not a production app.

## Running locally

```bash
bun install
bun run dev
```

The server listens on `http://localhost:6001` (see `index.ts`).

### Default credentials

The store seeds one account on startup so the app is never empty:

| username    | password      | display name |
| ----------- | ------------- | ------------ |
| `void_user` | `testpass123` | Void User    |

The same values are mirrored in `.provar/config.yml` so the Provar specs can log in without extra setup.
