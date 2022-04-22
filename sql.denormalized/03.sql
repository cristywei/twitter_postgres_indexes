/*
 * Calculates hashtags commonly used with #coronavirus
 */
SELECT lang, count(*) as count
FROM (
    SELECT DISTINCT data->>'id' AS id_tweets,  data->>'lang' AS lang
    FROM tweets_jsonb
    WHERE data->'entities'->'hashtags' @@ '$[*].text == "coronavirus"' or data->'extended_tweet'->'entities'->'hashtags' @@ '$[*].text == "coronavirus"'
) t
GROUP BY lang
ORDER BY count DESC, lang;
