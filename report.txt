# Project Report: Portugal Tourist Advisor – An Intelligent Expert System in Prolog

## 1. Introduction

### 1.1 Context and Task Definition

The objective of this project is to design and develop an "Intelligent Database" and Expert System capable of functioning as a comprehensive Portugal Tourist Advisor. The system is tasked with parsing user constraints (such as budget, interests, travel group, and accessibility needs) and synthesizing these into highly specific, actionable travel recommendations. Beyond simple data retrieval, the system must perform multi-variable reasoning: calculating multi-leg trip costs, inferring traveler profiles based on indirect answers, constructing seasonal itineraries, and actively preventing sub-optimal recommendations based on conflicting variables (e.g., crowded seasons, weather, and user preferences).

### 1.2 Why Prolog is the Ideal Approach

Prolog (Programming in Logic) represents a paradigm shift from traditional imperative languages (like Python or Java) and is exceptionally well-suited for this task. Instead of writing rigid, step-by-step algorithms, Prolog relies on declarative logic. The programmer defines a Knowledge Base of **facts** and the logical **rules** that govern them, and Prolog’s internal engine handles the search.

Prolog excels in this domain for several reasons:

* **Built-in Backtracking:** When searching for valid travel routes or destinations that meet multiple constraints (e.g., under budget, specific tags, safe, not rainy), Prolog automatically explores logical branches and backtracks if a constraint fails, without requiring complex nested loops.
* **Unification and Pattern Matching:** Prolog seamlessly binds variables across multiple relational tables (e.g., matching a city's cost profile with its regional safety index and current weather).
* **Constraint Satisfaction:** Using negation (`\+`), Prolog easily handles exclusionary logic (e.g., `avoid_if`), actively filtering out destinations that violate user constraints.
* **Native Graph Representation:** The transit network (cities connected by trains/buses) is naturally modeled as a mathematical graph using `connected/3` and `transport/5` facts, making pathfinding straightforward.

---

## 2. Implementation: Modules and Architecture

The system is architected into three highly cohesive but loosely coupled modules: The Knowledge Base (Data), the Core Reasoner (Logic), and the User Experience Module (Interface).

### 2.1 The Knowledge Base (Facts)

The Knowledge Base acts as a normalized relational database. It integrates static macroeconomic statistics inspired by **Pordata** with micro-economic cost-of-living metrics inspired by **Numbeo**. By atomizing the data, the system prevents redundancy and allows for dynamic querying. Key data structures include:

* **Geographic & Semantic Data:** `destination(City, Region, Tags)` categorizes 21 Portuguese cities with descriptive atoms.
* **Economic Variables:** `cost(City, Style, Accom, Meal, Transport)` provides granular, style-specific (budget/mid/luxury) pricing.
* **Temporal & Meteorological Data:** `weather(City, Month, Condition, Temp)` and `crowd_level(City, Month, Level)` map seasonal shifts, utilizing rule-based inheritance (e.g., deriving Braga's weather from Porto's).
* **Logistical Data:** `transport(From, To, Mode, Duration, Cost)` maps the inter-city transit network.
* **Metadata:** Rich contextual facts like `event/4`, `accommodation_type/3`, and `visa/5`.

### 2.2 The Core Reasoner (Logic)

The Reasoner interprets the user's intent and evaluates it against the Knowledge Base. It features several sophisticated sub-modules:

* **The Constraint Engine (`recommend/3` and `scored_recommend/4`):**
This engine filters destinations by unifying user tags with destination tags (`intersection/3`). It applies negative logic to filter out rainy destinations (`\+ Cond = rainy`) and utilizes the `avoid_if/2` rules to preemptively block conflicting combinations (e.g., preventing a recommendation of Albufeira if the user explicitly requests an `authentic` experience).
* **The Dynamic Profiler (`infer_profile/2`):**
Instead of relying on a first-past-the-post match, the profiler dynamically scores every predefined traveler profile (e.g., `budget_backpacker`, `luxury_traveler`) against the user's input. It applies a mathematical bonus (`StyleBonus`) if the user's requested budget aligns with the profile's ideal style, aggregates the scores using `findall/3`, sorts them via `msort/2`, and extracts the absolute highest-scoring profile.
* **The Smart Multi-City Calculator (`calculate_smart_trip/6`):**
This module utilizes recursive list processing to evaluate heterogeneous trip legs. As it iterates through a list of `[City-Days]`, it not only calculates the cost of staying in each city but actively looks up the specific `transport/5` cost to the *next* city in the list, accumulating a highly accurate grand total. It relies on a helper rule (`get_transport_cost/3`) that utilizes the **cut operator (`!`)** to search bidirectional transit routes, defaulting to a safety fallback estimate if no direct route exists.

### 2.3 The User Experience Module (Input/Output)

The UI bridges the gap between the user and the logical engine through a robust, terminal-based CLI.

* **State Management:** The menu loops continuously using tail recursion (`continue_or_exit`).
* **Input Validation:** Rules like `valid_month/1` and `valid_style/1` intercept bad inputs, providing graceful error messages and preventing the Prolog engine from crashing or failing silently.
* **Dynamic Formatting:** Output is strictly formatted using `format/2`, creating legible tables, itineraries, and cost breakdowns.

---

## 3. Evaluation

### 3.1 Effectiveness and Accuracy

The system highly succeeds in its primary goal of being an "Intelligent Advisor." The transition from simple database lookups to dynamic scoring mechanisms ensures that the system provides nuanced answers. For instance, the system does not merely return "Sintra" when queried for a summer day trip; it actively appends a generated warning (`Extremely crowded - book palace tickets weeks ahead`) based on the intersection of the destination and the month.

### 3.2 Robustness and Error Handling

A major strength of the implementation is its defensive programming. Prolog naturally fails silently when a query does not unify. By implementing `-> ;` (If-Then-Else) constructs within the `handle_choice` predicates, the system catches these failures and translates them into human-readable feedback. Furthermore, the implementation of "Relaxed Fallbacks" (e.g., `recommend_relaxed/3`) ensures that if a strict search yields zero results due to overly tight constraints (like weather), the system intelligently drops the least critical constraint and offers the closest alternative, rather than returning an empty screen.

### 3.3 Efficiency

Due to the relatively constrained domain space (21 destinations, 12 months), Prolog's depth-first search resolves queries virtually instantaneously. Aggregation functions like `findall/3` paired with `msort/2` operate well within optimal time complexities for this dataset size, making the application highly responsive.

---

## 4. Discussion and Future Work

### 4.1 Current Limitations

While the logic is robust, the current system has distinct limitations:

1. **Static Knowledge Base:** The data (prices, weather, transit) is hardcoded. While accurate at the time of creation, it requires manual updates to reflect macroeconomic inflation or timetable changes.
2. **Rigid Interface:** The system relies on precise Prolog syntax for inputs (e.g., requiring lists to be formatted as `[tag1, tag2].` and inputs to terminate with a period). This creates a friction point for non-technical end-users.
3. **Basic Pathfinding:** The `nearby_trips` module accurately finds adjacent nodes, but the system does not currently implement algorithms to find the absolute *shortest physical path* or *cheapest ticket path* across complex, multi-node graphs (like Dijkstra's or A* algorithm).

### 4.2 Future Expansions

To elevate this project from an academic expert system to a production-ready application, several expansions are proposed:

* **Natural Language Processing (NLP):** Prolog is historically renowned for NLP via Definite Clause Grammars (DCGs). Future iterations could implement a DCG parser, allowing the user to type conversational queries like *"I want a cheap beach trip in August"* which Prolog would parse into the logical query `scored_recommend([beach, budget], aug, Dest, Score)`.
* **External API Integration:** Modern Prolog distributions (like SWI-Prolog) support JSON and HTTP requests. The `cost/5` and `weather/4` facts could be replaced by dynamic rules that fetch live data from external APIs.
* **Advanced Constraint Logic Programming (CLP):** Utilizing Prolog's `clp(fd)` library would allow the system to solve highly complex scheduling tasks, such as generating an optimal 10-day itinerary that strictly adheres to a €1,000 budget while visiting exactly 4 distinct regions.

---

## 5. References

1. Clocksin, W. F., & Mellish, C. S. (2003). *Programming in Prolog* (5th ed.). Springer.
2. Bratko, I. (2011). *Prolog Programming for Artificial Intelligence* (4th ed.). Pearson.
3. Numbeo. (2024). *Cost of Living in Portugal*. Retrieved from [https://www.numbeo.com/cost-of-living/country_result.jsp?country=Portugal](https://www.numbeo.com/cost-of-living/country_result.jsp?country=Portugal)
4. Pordata. (2024). *Base de Dados Portugal Contemporâneo (Demographics and Tourism Indices)*. Fundação Francisco Manuel dos Santos. Retrieved from [https://www.pordata.pt/](https://www.pordata.pt/)
5. Wielemaker, J., Schrijvers, T., Triska, M., & Lager, T. (2012). SWI-Prolog. *Theory and Practice of Logic Programming*, 12(1-2), 67-96.