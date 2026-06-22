# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning
This approach succeeds in evenly distributing the data, allocating exactly two observations to each of the three boats regardless of the submarine's peak activity hours. However, it significantly compromises query efficiency because there is no logical mapping between timestamps and storage locations; a researcher looking for observations within a specific hour range is forced to scan all three boats to find the pieces. This requirement to query multiple instances simultaneously drastically increases the query load across the cluster, wastes network bandwidth, and raises latency, resulting in considerably slower response times.

## Partitioning by Hour
This method optimizes time-targeted queries, as a researcher looking for midnight data can find all four initial observations localized entirely on Boat A without querying the others. The major flaw is data imbalance, as demonstrated by the sample data where Boat A receives most of the load, Boat C receives a few, and Boat B remains completely empty, creating a severe storage hotspot during peak observation hours.

## Partitioning by Hash Value
This strategy achieves a uniform distribution of storage load across all databases, storing exactly two observations per boat, while allowing single-point lookups to map an exact timestamp directly to a single boat using its hash. The primary disadvantage is that it breaks the chronological alignment required for range queries; since consecutive midnight timestamps yield completely different hash values, consecutive records are scattered across all different boats, forcing a full-cluster scan for time-interval searches.