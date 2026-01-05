 Telco Churn Prediction — End-to-End MLOps Pipeline

An end-to-end MLOps demonstration for a **Telco customer churn prediction project**, inspired by Databricks' MLOps demos.  
This project implements a production-grade ML workflow using **MLflow**, **model registry**, and **feature management**, illustrating how to move a machine learning model from development to deployment and monitoring.

---

## Challenges in Moving ML Projects to Production

Transitioning an ML project from a standalone notebook to a production-ready data pipeline is complex and requires multiple competencies. Simply having a model running in a notebook is not enough. Key challenges include:

- **Data updates over time**: production-grade ingestion pipelines for up-to-date data.  
- **Feature sharing and reuse**: saving, sharing, and re-using ML features across the organisation.  
- **Model quality and governance**: ensuring new model versions meet quality standards and do not break pipelines.  
- **Model monitoring**: tracking deployed models, data drift, and retraining needs.  
- **Cross-team collaboration**: integrating Data Engineers, Data Scientists, and ML Engineers effectively.

**Teams typically involved:**

- **Data Engineers** – ingest, prepare, and expose the data.  
- **Data Scientists** – analyse data and build ML models.  
- **ML Engineers** – manage ML infrastructure and orchestrate pipelines (similar to DevOps).  

Without proper MLOps, production deployment is slowed, creating silos and delaying ROI.

---

## What is MLOps?

MLOps is a set of **standards, tools, processes, and methodologies** designed to optimise **time, efficiency, and quality** while ensuring **governance** in ML projects.  

It orchestrates the **project life-cycle** across teams to implement **smooth, reproducible, and governed ML pipelines**.

In this project, MLOps principles are applied to manage:

- Feature computation and storage
- Model training and hyperparameter optimisation
- Model registry and governance
- Batch and real-time inference
- Model monitoring and drift detection

---

## Project Architecture

This pipeline demonstrates a complete ML workflow for churn prediction:

1. **Feature Engineering** (`src/features/feature_engineering.py`)  
   - Prepare features and persist them to an offline feature store.

2. **Model Training** (`src/training/train_hpo.py`)  
   - Train ML models with hyperparameter optimisation (Optuna).

3. **Model Registry & Deployment** (`src/registry/register_model.py` / `src/registry/deploy_model.py`)  
   - Register and deploy models for governed use.

4. **Validation** (`src/validation/validate_challenger.py` / `src/validation/approve_challenger.py`)  
   - Perform champion-challenger analysis to validate new models.

5. **Batch Inference** (`src/inference/batch_inference.py`)  
   - Apply trained models in batch jobs for large datasets.

6. **Real-Time Feature Serving** (`src/inference/serve_model.py`)  
   - Enable real-time feature lookups for predictions.

7. **Monitoring & Drift Detection** (`src/monitoring/model_monitoring.py` / `src/monitoring/drift_detection.py`)  
   - Track data and model drift and trigger retraining if necessary.

---

## Key Technologies

- **MLflow OSS** — experiment tracking, model registry, and deployment.  
- **Delta Lake / Parquet** — feature storage and versioned datasets.  
- **Prefect / Airflow** — pipeline orchestration (optional, can be added).  
- **FastAPI + Docker** — real-time model serving and API endpoints.  
- **Python / scikit-learn / Optuna / pandas / NumPy** — core ML stack.

---

## Repository Structure

```
src/                    # Source code for features, training, registry, validation, inference, monitoring
pipelines/             # Orchestration scripts
data/                  # Raw and processed datasets
models/                # Persisted ML models
notebooks/             # Exploratory and demo notebooks
tests/                 # Unit and integration tests
Makefile               # Automation commands
requirements.txt       # Python dependencies
README.md              # Project overview
```

---

## How to Run

1. **Clone the repository:**

```bash
git clone https://github.com/dmishra27/telco-churn-mlops.git
cd telco-churn-mlops
```

2. **Install dependencies:**

```bash
pip install -r requirements.txt
```

3. **Run pipeline scripts in order:**

```bash
python src/features/feature_engineering.py
python src/training/train_hpo.py
python src/registry/register_model.py
python src/validation/validate_challenger.py
python src/inference/batch_inference.py
python src/inference/serve_model.py
python src/monitoring/model_monitoring.py
python src/monitoring/drift_detection.py
```

Later, orchestration via Prefect or Airflow can replace manual execution.

---

## Business Impact

This pipeline demonstrates how Telco companies can predict customer churn reliably and operationalise ML models for:

- Timely intervention on at-risk customers
- Automating model updates and retraining
- Ensuring governance and reproducibility across teams

By applying MLOps, ML projects become production-ready, maintainable, and scalable, accelerating ROI and reducing friction between teams.

---
