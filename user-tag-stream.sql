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