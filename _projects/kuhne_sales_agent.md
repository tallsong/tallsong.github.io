---
title: 'Sales Data Analytic Agent'
date: 2026-1-21
permalink: /posts/2026/1/SalesDataAnalyticAgent/
tags:
  - Agent
  - Azure
---

# Sales Data Analytic Agent
> An enterprise-grade Sales Analysis Agent built on Microsoft Azure that orchestrates the ingestion of large-scale datasets and executes asynchronous Python workflows to automate data cleaning, normalization, and competitor matching.

![Python](https://img.shields.io/badge/Python-3.13%2B-blue)


## 📖 Introduction
**Why this project exists:**
Sales analysts are currently bottlenecked by the inability of standard AI tools to process large, messy datasets (>200MB), forcing them to manually clean data and painstakingly match thousands of ambiguous competitor product descriptions to internal hierarchies.

## 🚀 Demo / Screenshots


## 🛠️ Technical Architecture

### Tech Stack
| Architecture Layer | Technology | Key Purpose | Pricing Model |
| :--- | :--- | :--- | :--- |
| **Frontend & Orchestration** | **Microsoft Copilot Studio** | Provides the chat interface (UI), manages conversation history, and handles intent recognition. Native integration with MS Teams. | Monthly License (Tenant) + Billed per Message/Interaction |
| **Intelligence Engine** | **Azure OpenAI Service** | Provides the LLM (GPT-4o or GPT-4-Turbo) for code generation, semantic reasoning, and complex data analysis planning. | Pay-as-you-go (Per Input/Output Token) |
| **Backend API Framework** | **Python (FastAPI)** | The application logic layer. Exposes REST endpoints that Copilot Studio calls as "Plugins". Handles file I/O and orchestration logic. | Open Source (Hosting costs apply) |
| **Compute & Hosting** | **Azure Container Apps** | Serverless container platform to host the FastAPI backend. Scales to zero when unused to save costs. | Consumption-based (vCPU/Memory seconds) |
| **Secure Code Execution** | **Azure Container Apps Dynamic Sessions** | A secure, sandboxed "Code Interpreter" environment to run generated Python code safely without risking the host server. | Pay-as-you-go (Per Session Hour) |
| **Data Storage** | **Azure Data Lake Storage Gen2 (ADLS)** | Stores large uploaded datasets (>200MB) and persists analysis artifacts (cleaned CSVs, plots). | Pay-as-you-go (Storage capacity + Read/Write operations) |
| **Agent Logic Framework** | **LangGraph / LangChain** | Python libraries to manage the agent's internal state machine, specifically for complex loops like the Drotax data cleaning workflow. | Open Source |

### System Design
```mermaid
graph TD
    %% Define Styles for clarity
    classDef user fill:#E6E6E6,stroke:#333,stroke-width:2px,color:black,rx:10,ry:10;
    classDef copilot fill:#7731D8,stroke:#5C21A5,stroke-width:2px,color:white,rx:5,ry:5;
    classDef azurecompute fill:#0078D4,stroke:#004E8C,stroke-width:2px,color:white,rx:5,ry:5;
    classDef azureai fill:#00A4EF,stroke:#0078D4,stroke-width:2px,color:white,rx:5,ry:5;
    classDef storage fill:#FFB900,stroke:#C48F00,stroke-width:2px,color:black,rx:2,ry:2;

    %% --- Top Layer: User Interface ---
    subgraph Frontend ["Frontend & Interaction Layer"]
        Analyst((👤 Sales Analyst)):::user
        MSTeams[Microsoft Teams / Web Chat]:::copilot
    end

    %% --- Middle Layer: Copilot Orchestration ---
    subgraph CopilotStudio ["Microsoft Copilot Studio (SaaS)"]
        style CopilotStudio fill:#f3eefe,stroke:#7731D8,stroke-width:2px,stroke-dasharray: 5 5
        DialogEngine["💬 Bot Dialog Engine<br/>(Intent Recognition & Flow Control)"]:::copilot
        PluginConn["🔌 Custom Connector<br/>(OpenAPI / Swagger Definition)"]:::copilot
    end

    %% --- Bottom Layer: Custom Azure Backend ---
    subgraph Azure Backend ["Azure Cloud Platform (PaaS/Serverless)"]
        style Azure Backend fill:#e6f7ff,stroke:#0078D4,stroke-width:3px

        subgraph Compute ["Custom Application Logic"]
            APIBackend["⚙️ Agent API Backend<br/>(Azure Container Apps running FastAPI)"]:::azurecompute
            LangGraphLogic[("🧠 LangGraph Agent Logic<br/>(Drotax Cleaning & Orchestration)")]:::azurecompute
        end

        subgraph ExecutionEnvironment ["Secure Execution"]
            Sandbox["📦 Dynamic Sessions Sandbox<br/>(Secure Python Code Interpreter)"]:::azurecompute
        end

        subgraph Intelligence ["AI Models"]
            AOAI["🤖 Azure OpenAI Service<br/>(GPT-4o Model)"]:::azureai
        end

        subgraph DataLayer ["Storage"]
            ADLS[("💾 Azure Data Lake Gen2<br/>(Datasets & Artifacts >200MB)")]:::storage
        end
    end

    %% --- Connections & Data Flow ---

    %% 1. User interacts with the bot
    Analyst -->|"1. Uploads file & asks query"| MSTeams
    MSTeams --> DialogEngine

    %% 2. Copilot delegates hard work to Azure
    DialogEngine --"2. Triggers Action (via REST API)"--> PluginConn
    PluginConn --"3. Calls Backend API (/analyze)"--> APIBackend

    %% 3. Backend orchestrates the work
    APIBackend --"Uses"--> LangGraphLogic
    LangGraphLogic --"4. Prompt for Plan/Code"--> AOAI
    AOAI --"Returns Python Code"--> LangGraphLogic

    %% 4. Secure Execution Loop
    LangGraphLogic --"5. Submits Code for Execution"--> Sandbox
    Sandbox -.-|"6. Reads Data / Writes Results"| ADLS
    Sandbox --"7. Returns Results/Files"--> LangGraphLogic

    %% 5. Data Management (Direct uploads)
```
## 💡 Key Challenges & Solutions (The "STAR" Method)
### Challenge 1: [Name of the Challenge, e.g., Reducing Latency in LLM Response]
* **Situation:** The initial response time was over 10 seconds, which was poor UX.
* **Task:** Reduce latency to under 2 seconds.
* **Action:** Implemented semantic caching (Redis) and switched to a quantized model format (GGUF).
* **Result:** Reduced average latency by 80% without significant loss in accuracy.

### Challenge 2: [e.g., Handling Concurrent Users]
* **Situation:** ...
* **Action:** ...
* **Result:** ...

## 💻 How to Run
```bash
# Clone the repository
git clone [https://github.com/your-username/project-name.git](https://github.com/your-username/project-name.git)

# Run with Docker
docker-compose up --build
