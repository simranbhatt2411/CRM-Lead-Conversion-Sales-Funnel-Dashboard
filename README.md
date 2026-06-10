# End-to-End CRM Lead Conversion & Sales Funnel Data Pipeline

An advanced, multi-stage data analytics project that builds a complete data pipeline: extracting raw CRM transactional data, processing and cleaning it through a Python ETL workflow, and engineering a high-fidelity interactive Power BI application for executive pipeline tracking.

The final visual interface features a unified, premium ultra-dark theme highlighted by custom neon purple (`#6B007B`) structural borders to maximize data scannability.

---

## 📐 Enterprise Data Architecture Workflow

1. **Relational Data Mapping:** Structured cross-table data integrity using individual transactional tracking across four separate master CSV datasets (`Leadss`, `Conversions`, `Followups`, and `Ads`).
2. **Programmatic ETL & Exploratory Data Analysis (EDA):** Leveraged a Python Jupyter Notebook environment to clean anomalies, handle missed data records, compute statistics, and prepare datasets for rapid visual loading engines.
3. **Power BI Semantic Modeling:** Implemented star-schema single-directional cross-filtering rules and custom DAX metrics to build a fully synchronized, two-page enterprise reporting dashboard.

---

## 📂 Repository File Structure

Based on the core workspace development files, the project repository is organized as follows:

* **`/Ads.csv`**: Marketing spend metrics, campaign tracking data, and acquisition channel costs.
* **`/Conversions.csv`**: Closed-won transactional database mapping converted lead IDs to closed revenue metrics.
* **`/Followups.csv`**: Granular interaction records logging sales activity counts and outreach responses.
* **`/Leadss.csv`**: Core parent database tracking master lead IDs, locations, assigned sales reps, and funnel statuses.
* **`crm_analysis.ipynb`**: Master Python notebook executing data wrangling, cleaning transformations, and exploratory data profiles.
* **`crm_analysis.html`**: Pre-rendered, browser-viewable export of the Python data cleaning execution.
* **`CRM analytics Dashnboard.pbix`**: Interactive, master Power BI Desktop application file.
* **`/Sql ss/`**: Documented visual steps of relational database scripting and preliminary query extraction milestones.
* **`/Jupyter ss/`**: Step-by-step visual documentation of the data cleaning pipeline and data frame validation.
* **`/dashboard ss/`**: Portfolio-ready screen captures of the finalized interactive dashboard interface pages.

---

## 📊 Interactive Dashboard Previews

### Page 1: Executive Analytics Summary
*Monitors higher-level conversion volumes, top funnel revenue ($15M total), and strategic acquisition performance metrics.*
![Executive Dashboard](dashboard%20ss/page1.png) *(Ensure your screenshot inside the 'dashboard ss' folder is named page1.png)*

### Page 2: Detailed Performance Analysis
*Features cross-filtered segmentation tracking individual sales representatives, drop-off paths, and operational takeaways.*
![Detailed Analysis Dashboard](dashboard%20ss/page2.png) *(Ensure your screenshot inside the 'dashboard ss' folder is named page2.png)*

---

## 🛠️ Technical Implementation Highlights

### 🗄️ 1. Data Ingestion & Scripting (SQL Milestone)
* Organized relationship rules across disparate marketing and sales logs by tracking parent-to-child entity configurations.
* Created filtered extractions to isolate key database cohorts, explicitly segmenting conversion rows from raw lead inputs.

### 🐍 2. Data Cleaning & Engineering (Python Framework)
* Programmatically read and joined disparate source files utilizing the `Pandas` and `NumPy` data structures.
* Validated database health by locating missing records, adjusting syntax schema types, and evaluating cross-variable correlation values.
* Exported polished data outputs structured cleanly for efficient Power BI engine processing.

### 📈 3. Analytical UI Engineering (Power BI Dashboard)
* **DAX Formula Engineering:** Developed custom semantic business logic, including a multi-table calculation engine to isolate successful conversion percentages across the active pipeline database:
```dax
  Conversion Rate = 
  DIVIDE(
      CALCULATE(COUNT(Leadss[Lead_ID]), Leadss[Lead_Status] = "Converted"),
      COUNT(Leadss[Lead_ID]),
      0
  )

Cohesive Corporate Theme: Designed an ultra-dark UI dashboard skin using fine-lined #6B007B purple visual perimeter boundaries to separate filter criteria areas from core numerical visualizations.

State Synchronization Navigation: Engineered completely synchronized left navigation filter panels across multiple dashboard interfaces, ensuring user filtering choices persist seamlessly while switching views.

🎯 Strategic Business Takeaways Modeled
Sales Velocity Tracking: Pinpoints conversion metrics alongside total revenue generation volumes ($15M total pipeline value) across sales representatives like Aman, Karan, Riya, and Vikas.

Funnel Drop-Off Identification: Uncovers granular workflow drop-offs between distinct stages (e.g., Contacted, Qualified, Demo, Proposal, and Closed Won) to target operational bottlenecks.

Industry Performance Deep Dives: Segmentally breaks down lead distributions across Manufacturing, Tech, Healthcare, and Finance industries to target high-value verticals.

🚀 How to Interact with this Repository
Open crm_analysis.ipynb right here on GitHub to inspect the complete Python data transformation source code.

Download the CRM analytics Dashnboard.pbix workspace file.

Open the file inside Power BI Desktop to filter data, click charts, and explore the interactive visuals locally.
