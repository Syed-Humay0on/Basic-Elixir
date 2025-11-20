# 15-Day Elixir Roadmap

## Overview
Learn Elixir from scratch by building real projects. No iex, just `.ex` files you can save.

## The Plan

**Days 1-3: Core Syntax**
- Day 1: Basic syntax, modules, data types (integers, floats, strings, atoms, lists, tuples, maps)
- Day 2: Pattern matching on lists, maps, tuples
- Day 3: Pipe operator, function composition

**Days 4-6: Processes & State**
- Day 4: spawn, send, receive messages
- Day 5: Stateful processes (build a KV store)
- Day 6: Links, monitors, fault tolerance basics

**Days 7-9: OTP Foundations**
- Day 7: GenServer (proper client/server pattern)
- Day 8: Supervisors (build supervision trees)
- Day 9: OTP Applications & configuration

**Days 10-12: Real-World Tools**
- Day 10: HTTP clients (HTTPoison) & JSON (Jason)
- Day 11: Web scraping with Floki
- Day 12: Rate-limited concurrent processing

**Days 13-15: Final Projects**
- Day 13: Build a REST API with Plug
- Day 14: Supervised web scraper
- Day 15: Concurrent web crawler (spider)

## What You'll Build
1. **REST API** - JSON API with routing
2. **Web Scraper** - Fault-tolerant data extractor
3. **Crawler** - Multi-process spider demonstrating concurrency

## Running the Code
```bash
# Single file days
elixir lib/day01.ex

# Mix project days (7-9, 14-15)
mix new my_app --sup
cd my_app
mix deps.get
mix test
