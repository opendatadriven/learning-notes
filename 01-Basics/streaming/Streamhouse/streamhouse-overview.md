# Streamhouse
It needs to be an architectural framework combining Lakehouse and Realtime Stream with
- guaranteeing Lakehouse's flexibility and structured reliability, 
- having capability of realtime computation.


## Background
### Lakehouse vs Realtime Stream - Cost vs Latency
Latency: time is money, faster decision making inherently accelerates business operations.

Cost: streaming jobs are typically expensive.

### Streaming job Predicament
The lack of readiness in streaming infrastructure is impeding the recognition of real-time business needs.

```
no business requirements -> no streaming infrastructure
  \                                               /
      no recognition of real-time business needs 
```

### Lakehouse's challenge
Batch-First DNA
- Spark's Micro-Batch limitations
  - RDD based micro-batches limiting latency to 100ms ~ 1s
  - Poor handling of event-time disorder (approximate watermarks)
  - Costly state management for long windows (e.g. 24h sessions)
- Storage Layer Optimized for Batch
  - File-based object storage (S3/HDFS) struggles with high-frequency small writes
  - Uses HDFS/S3 for checkpointing, causing slow recovery (full snapshots vs. Flink’s incremental checkpoints)
- Missing Streaming Ecosystem
  - Cumbersome CDC pipelines (vs Flink's direct binlog integration)
  - No tiered state backend (like Flink's RocksDB)


## Requirements
### Basic
- Unified Batch/Stream Processing
  - Config based toggling between modes
  - Cost-Freshness tradeoff
- Stream-Native Foundation
  - Event-time processing
  - Stateful operation
  - Dynamic partition detection
  - Incremental checkpoints
- Storage Layer Revolution
  - Solving high-frequency small-file problems
  - Unified metadata to eliminate dual metadata silos
  - Tiered data management with cost optimization

### Advanced
- Functional
  - Granular control over data freshness - dynamic SLA policies
  - High storage layer abstraction - hide storage complexity
- Performance
  - Advanced indexing & partitioning
  - Intelligent materialized views
- Extensibility
  - Configuration as code


# Reference
- The State of Lakehouse Architecture: https://www.dataengineeringweekly.com/p/the-state-of-lakehouse-architecture
- Lakehouse challenges: https://medium.com/data-engineering-with-dremio/the-data-lakehouse-the-benefits-implementation-challenges-and-implementation-solutions-5202925b4125
- Lakedb - next evolution of the Lakehouse Architecture: https://www.dataengineeringweekly.com/p/envisioning-lakedb-the-next-evolution
- Streamhouse unveiled: https://www.ververica.com/blog/streamhouse-unveiled
