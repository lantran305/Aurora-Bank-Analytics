# Aurora Bank | Banking Analytics Dashboard

**Tools:** PostgreSQL · SQL · Python · Power Query · Power BI · DAX

## 1. Project Overview

This project aims to develop an interactive banking analytics dashboard that supports **data-driven decision-making** in retail banking.

The analysis focuses on three key areas:

- **Customer Growth:** Identify high-potential customer segments.
- **Payment Performance:** Evaluate transaction performance across merchants and regions.
- **Credit Risk:** Identify customer groups with elevated credit risk indicators.

## 2. Business Understanding — Design Thinking

### Phase 1 — Empathize | Stakeholder Analysis

**Primary Stakeholder: Head of Retail Banking**

| Key Question | Stakeholder Perspective |
|---|---|
| **Who will view this dashboard?** | **Head of Retail Banking**, responsible for overseeing **customer growth, card transaction performance, and retail credit portfolio quality**. |
| **What problem does this dashboard solve?** | Provides a **consolidated view** of customer segments, transaction performance, and credit risk indicators to identify **growth opportunities, operational inefficiencies, and potentially vulnerable customer groups**. |
| **When and where will the stakeholder view the dashboard?** | During **weekly performance reviews, monthly management meetings, and strategic planning sessions**, primarily through Power BI on a work computer. |
| **Why does this problem need to be solved?** | To support **sustainable business growth** by improving **customer targeting, payment performance**, and early identification of **credit risk concerns**. |
| **How does the stakeholder make decisions?** | Uses a **data-driven, exception-based approach**: monitors key KPIs, compares performance across customer segments, merchants, and regions, investigates underperforming or high-risk groups, and **prioritizes actions based on business impact and risk**. |

*Note: Stakeholder needs and usage scenarios are assumptions developed for this portfolio project, not findings from actual stakeholder interviews.*

### Phase 2 — Define | Problem Definition

| Component | Key Points |
|---|---|
| **Core Problem** | Limited **consolidated visibility** into customer potential, payment performance, and credit risk indicators. |
| **Customer Growth** | Identify **high-potential customer segments** based on income, spending behavior, and credit score. |
| **Payment Performance** | Identify **underperforming merchants, regions, and transaction error patterns**. |
| **Credit Risk** | Identify customer segments with **elevated risk indicators** based on debt, income, and credit score. |
| **Desired Outcome** | Support **data-driven decisions** to improve growth, operational efficiency, and credit quality. |

#### Problem Statement

> How might we help the **Head of Retail Banking** identify **growth opportunities**, improve **payment performance**, and monitor **credit risk indicators** to support **sustainable business growth**?

#### Success Criteria

- Identify **high-potential customer segments**.
- Highlight **merchants and regions** requiring operational attention.
- Identify customer groups with **elevated credit risk indicators**.
- Provide **actionable insights** to support management decisions.

## 3. Dataset Overview

The dataset contains four tables covering customer profiles, payment cards, transactions, and merchant categories.

| Table | Description |
|---|---|
| `users_data` | Customer demographics, income, debt, and credit scores |
| `cards_data` | Card information, types, brands, and credit limits |
| `transactions_data` | Transaction amounts, payment methods, merchants, and errors |
| `mcc_codes` | Merchant category code descriptions |

**Data Limitation:** The dataset does not include loan delinquency or default status. Therefore, credit risk analysis focuses on **risk indicators rather than actual non-performing loan rates**.

## 4. Data Processing & Technical Workflow

1. **Data Ingestion:** Import source CSV files into PostgreSQL using Python.
2. **Data Cleaning:** Clean and standardize data using SQL, transforming raw tables into staging tables.
3. **Data Modeling:** Establish relationships and analytical dimensions in Power BI.
4. **DAX & Visualization:** Develop business measures and interactive dashboard pages.
5. **Business Insights:** Interpret findings and recommend potential business actions.

## 5. Dashboard Structure


## Dashboard Structure

| Dashboard Page | Business Question | Key KPIs |
|---|---|---|
| **1. Overview** | How is the bank performing overall? | Total Transactions, Gross Spending, Refunds, Error Rate |
| **2. Customer Analysis** | Who are the bank's high-potential customers? | Total Customers, Income, Spending, Credit Score |
| **3. Merchant Performance** | Which merchants or regions are underperforming? | Total Transactions, Transaction Volume, Error Rate |
| **4. Credit Risk Analysis** | Which customer segments have the highest credit risk? | Outstanding Debt, Credit Score, Debt-to-Income Proxy |

## 6. Project Status

**In Progress**

- [x] Data ingestion
- [x] SQL data cleaning
- [x] Business understanding and problem definition
- [ ] Power BI data modeling
- [ ] Dashboard development
- [ ] Business insights and recommendations

---
