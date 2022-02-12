use simple_syrup::*;

#[tokio::main]
async fn main() {
    let db = SimpleSqlite::new("data.db");
    let schema = Schema::build(QueryRoot, EmptyMutation, EmptySubscription);

    SimpleGraphql::new(schema)
        .with_sqlite(db)
        .with_spa("assets/public", "assets/public/index.html")
        .run()
        .await
}

struct QueryRoot;

#[Object]
impl QueryRoot {
    async fn two(&self, ctx: &Context<'_>) -> Result<i64> {
        let pool = ctx.data::<SqlitePool>()?;

        let result: (i64,) = sqlx::query_as("SELECT 1 + 1").fetch_one(&*pool).await?;
        Ok(result.0)
    }
}
