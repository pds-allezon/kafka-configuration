CREATE TABLE aggregates AS
    SELECT
        SUBSTRING(time, 1, 16) AS bucket,
        action,
        origin,
        productInfo->brandId AS brandId,
        productInfo->categoryId AS categoryId,
        SUM(productInfo->price) AS sumPrice,
        COUNT(*) AS count
    FROM userTags
    GROUP BY SUBSTRING(time, 1, 16), action, origin, productInfo->brandId, productInfo->categoryId;
