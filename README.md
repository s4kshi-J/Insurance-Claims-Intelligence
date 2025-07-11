# Insurance-Claims-Intelligence

An end-to-end insurance claims risk analysis project using R and Power BI. This project explores fraud detection using Benford’s Law, identifies outliers in claim components, and segments policyholders into risk clusters using K-means clustering.

## Features
- Applied Benford’s Law to detect claim amount manipulation
- Identified outliers in injury, property, and vehicle claims using IQR
- Created risk clusters using K-means and added interpretive labels
- Designed Power BI visuals for claim trends, geographic hotspots, and fraud segmentation

## Tools Used
- R (data.table, benford.analysis, ggplot2, clustering)
- Power BI (heatmaps, KPIs, filters, drill-throughs)

## File Structure
- `R/fraud_analysis.R` – R script with fraud and clustering logic
- `PowerBI/ClaimsIntelligence.pbix` – Power BI dashboard (optional)
- `Screenshots/` – Visuals of results and dashboard

## Preview

![Benford's Law Analysis](Screenshots/benford_plot.png)
