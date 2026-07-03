# ROADMAP.md - Milestone Plan

## Development Phasing (2 Developers)
This plan focuses on systematically expanding the existing foundation into a production-hardened rogue-like deck-builder structure.

---

## Phase 1: Refining the Foundation (The Core Grid)
*Goal: Solidify the current codebase grid logic to support dynamic board scaling and rogue-like items.*

### Milestone 1.1: Standardized Data Layers
- [ ] Implement strict static typing extensions across `chess.gd`.
- [ ] Isolate core coordinate tracking data structures from visual scene nodes in `main.tscn`.
- [ ] Set up the GitHub project management automation with strict branch validation rules.

### Milestone 1.2: Dynamic Boards
- [ ] Generalize the board array setups to allow dynamic expansion or shrinkage (`Vector2i`) per round.
- [ ] Add support for injecting cell-specific modifiers into the coordinate grid database.

---

## Phase 2: Economy & Upgrade Mechanics
*Goal: Build structural frameworks for currency management, store interactions, and inventory handling.*

### Milestone 2.1: The Shop Framework
- [ ] Create a modular storefront interface layout inside `Scenes/`.
- [ ] Build the `ShopItem` Custom Resource structure supporting:
  - **Piece Buffs:** Extra movement patterns or stat attributes.
  - **Tile Enhancements:** Board coordinates that trigger custom mechanics (e.g., gold multipliers).
  - **One-Time Consumables:** Direct action cards selectable from a player hotbar.

### Milestone 2.2: Reward Vectors
- [ ] Program end-of-round financial payouts based on victory types, remaining assets, or action speed.

---

## Phase 3: Game Loop Expansion
*Goal: Integrate distinct progression setups for Single Player and Local 2-Player modes.*

### Milestone 3.1: Rogue-like Campaign (Single Player)
- [ ] Code procedural opponent scaling arrays to balance pacing.
- [ ] Build boss validation rules (e.g., clear matching parameters under strict turn boundaries).
- [ ] Code an infinite difficulty tier modifier to support Endless Mode.

### Milestone 3.2: Match Point Tally (Two-Player)
- [ ] Add custom configuration lobbies to define maximum round thresholds.
- [ ] Develop point compilation architectures to showcase an end-of-game victory podium.

---

## Phase 4: Production Hardening & Balance Checks
*Goal: Code optimization, project asset refinement, and build preparation.*

### Milestone 4.1: UI Polishing & Safe Systems
- [ ] Hook up visual path highlights for custom pieces and modified threat zones.
- [ ] Implement robust edge-case checks for turn validation loops to maintain state sync.

### Milestone 4.2: Resource Clean-up
- [ ] Optimize structural asset streaming to prevent memory overhead on dynamically updated tiles.