# Learning Journal

A personal log of Elixir/OTP concepts I picked up while building this project.
Each phase ends with a short note in my own words.

---

## Phase 0 — Environment & repo setup

**Date:** 2026-06-03

**What I did this phase:**
- Set up the toolchain on a remote Linux box: mise + Erlang/OTP 27.2 + Elixir 1.18.1.
- Generated the project with `mix phx.new` (Postgres + binary IDs, LiveView by default).
- Wired Postgres on the host machine, verified `mix ecto.create` and `mix test`.
- Launched `mix phx.server`, opened the default Phoenix page and `/dev/dashboard`.
- Poked the DB from IEx (`iex -S mix`) to confirm the Repo is live.
- Published the public repo on GitHub and wired up GitHub Actions CI
  (format check, compile with warnings-as-errors, `mix test`) — green on first run.

**Concepts I now understand:**
- OTP / BEAM / Erlang vs Elixir — what they are, the JVM analogy.
- `mix.exs` — project manifest, deps, OTP-app declaration.
- Application supervision tree — what `Application.start/2` does at boot.
- Compile-time vs runtime config (`config/*.exs` vs `runtime.exs`).
- `use Module, :arg` and the `__using__/1` macro — Phoenix wrapper module.
- Plug pipeline in `endpoint.ex` and `router.ex` — pipelines, scopes, `pipe_through`.
- "Let it crash" + supervisor restart strategies.
- Bandit vs Cowboy — Phoenix 1.8 default and why.

**What surprised me coming from JVM:**
- The supervision tree was new to me as a primitive, but structurally it
  echoes Kotlin's structured concurrency — `CoroutineScope` is hierarchical,
  `SupervisorJob` ≈ a `:one_for_one` supervisor, cancellation propagates
  through the job tree the way exits propagate through links. Realising this
  also made it clear where Kotlin coroutines borrowed their ideas from.
  Where the analogy breaks: OTP supervisors *restart* failed children
  (coroutines just die), BEAM processes share no memory at all, and
  scheduling is preemptive rather than cooperative.
- The compile-time vs runtime config split was familiar from C/C++
  (`#ifdef`, `-D` flags, `constexpr`) — but it was a fresh mental shift
  after years of "everything is runtime via `application.yml`" on the JVM.

**Open questions:**
- —
