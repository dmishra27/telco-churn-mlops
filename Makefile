# Makefile for automating common tasks

.PHONY: install run test

install:
\tpip install -r requirements.txt

run-pipeline:
\tpython src/features/feature_engineering.py
\tpython src/training/train_hpo.py
\tpython src/registry/register_model.py
\tpython src/validation/validate_challenger.py
\tpython src/inference/batch_inference.py
\tpython src/inference/serve_model.py
\tpython src/monitoring/model_monitoring.py
\tpython src/monitoring/drift_detection.py

test:
\tpytest tests/
