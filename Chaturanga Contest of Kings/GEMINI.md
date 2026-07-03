# GEMINI.md - Developer Guide & Project Standards

## Project Identity & Architecture
* **Project Name:** Chaturanga: Contest of Kings (Deck-Builder Edition)
* **Engine:** Godot Engine 4+ (GDScript)
* **Version Control:** Git / GitHub
* **Team Size:** 2 Developers
* **Target:** Production-ready, modular, and highly scalable deck-building chess game heavily inspired by *Balatro*.

---

## Project Structure & Architecture Standards

### 1. Existing Directory Layout
Keep script extensions, asset paths, and scene mappings aligned with the existing codebase organization:
```text
Chaturanga Contest of Kings/
├── Assets/               # Textures, piece icons (e.g., black_bishop.png, Chess_board.png)
├── Scenes/               # UI and Scene Trees (main.tscn, texture_holder.tscn)
├── Scripts/              # Component behaviors and attached scripts
├── chess.gd              # Core grid management / chess state tracking
└── project.godot         # Godot project settings configuration
```

### 2. Code Reusability & Type Safety
* **Static Typing:** Enforce static typing across all new GDScript files (`var piece_id: String`, `func calculate_moves() -> Array[Vector2i]`) to guarantee predictable behavior during 2-player development.
* **Composition-Focused Design:** Instead of deep inheritance trees for custom pieces, use a modular component architecture. Custom pieces, storefront perks, and board cell adjustments should load custom data states via Godot `Resource` types.
* **Decoupled Architecture:** Keep visual rendering nodes separate from the core chess board layout calculation matrices in `chess.gd`.

### 3. Collaboration Workflow
* **Git Flow:** Use clear feature branch separations (`feature/shop-mechanics`, `bugfix/grid-tiling`).
* **Code Alignment:** Follow `.editorconfig` style properties explicitly to ensure formatting consistency between teammates.
* **Review Gateways:** Submit clear Pull Requests on GitHub; direct commits to stable tracks are restricted to preserve build health.

---

## Feature Architecture Specifications

### 1. The Economy Loop & Storefront
* **ShopItem Resource:** Design a unified data structure representing buyable items (Piece Upgrades, Space Modifications, One-Time Cards).
* **Grid Enhancements:** Cell modifiers should write attributes natively into a coordinate-mapped state database inside the board tracking layer.

### 2. Game Mode Handlers
* **Single Player Loop:** Progressive opponent updates leading to a final boss checkpoint, followed by a procedural endless difficulty generator.
* **Local Two-Player Loop:** Match configurations allowing players to define set round lengths, compiling points on an end-of-round score board.