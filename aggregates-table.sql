CREATE STREAM userTags (
    time VARCHAR,
    cookie VARCHAR,
    country VARCHAR,
    device VARCHAR,
    action VARCHAR,
    origin VARCHAR,
    productInfo STRUCT<
        productId VARCHAR,
        brandId VARCHAR,
        categoryId VARCHAR,
        price INT
    >
)
    WITH (kafka_topic='user-tags', format='json', partitions=1);

CREATE TABLE aggregates AS
    SELECT
        SUBSTRING(time, 1, 16) AS bucket,
        action,
        origin,
        productInfo->brandId AS brandId,
        productInfo->categoryId AS categoryId,
        SUM(CAST(productInfo->price AS BIGINT)) AS sumPrice,
        COUNT(*) AS count
    FROM userTags
    GROUP BY SUBSTRING(time, 1, 16), action, origin, productInfo->brandId, productInfo->categoryId;
