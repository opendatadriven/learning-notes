# 🦆 DuckDB Demo with 🤗 Hugging Face + Jupyter + uv

This project demonstrates how to use [DuckDB](https://duckdb.org) to analyze datasets from Hugging Face inside a Jupyter notebook, with fully reproducible Python environments managed by [`uv`](https://github.com/astral-sh/uv).

## Features

- Load ibm duorc dataset from Hugging Face
- Save and query Parquet files with DuckDB
- Visualize result with matplotlib
- Jupyter notebook environment with full reproducibility using `uv`

## Requirements

- Python 3.8+
- Jupyter + VSCode

## Setup

### Set Up Environment with uv

> Make sure you have [uv installed](https://docs.astral.sh/uv/getting-started/installation/).

```bash
uv venv
source .venv/bin/activate
uv pip install -r requirements.txt
```

### (Once) Register the Environment for Jupyter

```bash
python -m ipykernel install --user --name=duckdb-demo --display-name="Python (duckdb-demo)"
```

- Open a .ipynb notebook
- Top-right: click the kernel name → Select "Python (duckdb-demo)"
- VSCode will use this virtualenv

## Rebuild Clean Environment

```bash
rm -rf .venv
uv venv
source .venv/bin/activate
uv pip install -r requirements.txt
```
