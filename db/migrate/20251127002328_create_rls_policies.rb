class CreateRlsPolicies < ActiveRecord::Migration[8.0]
  def up
    execute <<-SQL
      ALTER TABLE users ENABLE ROW LEVEL SECURITY;
      ALTER TABLE posts ENABLE ROW LEVEL SECURITY;
      ALTER TABLE comments ENABLE ROW LEVEL SECURITY;

      ALTER TABLE users FORCE ROW LEVEL SECURITY;
      ALTER TABLE posts FORCE ROW LEVEL SECURITY;
      ALTER TABLE comments FORCE ROW LEVEL SECURITY;
    SQL

    execute <<-SQL
      CREATE POLICY user_policy ON users
        AS PERMISSIVE
        FOR ALL
        TO PUBLIC
        USING (tenant_id = current_setting('app.current_tenant_id')::BIGINT)
        WITH CHECK (tenant_id = current_setting('app.current_tenant_id')::BIGINT);

      CREATE POLICY post_policy ON posts
        AS PERMISSIVE
        FOR ALL
        TO PUBLIC
        USING (tenant_id = current_setting('app.current_tenant_id')::BIGINT)
        WITH CHECK (tenant_id = current_setting('app.current_tenant_id')::BIGINT);

      CREATE POLICY comment_policy ON comments
        AS PERMISSIVE
        FOR ALL
        TO PUBLIC
        USING (tenant_id = current_setting('app.current_tenant_id')::BIGINT)
        WITH CHECK (tenant_id = current_setting('app.current_tenant_id')::BIGINT);
    SQL

    # 全テーブルのオーナーをapp_userに変更
    execute <<-SQL
      ALTER TABLE users OWNER TO app_user;
      ALTER TABLE posts OWNER TO app_user;
      ALTER TABLE comments OWNER TO app_user;
      ALTER TABLE tenants OWNER TO app_user;
      
      -- シーケンスのオーナーも変更
      ALTER SEQUENCE users_id_seq OWNER TO app_user;
      ALTER SEQUENCE posts_id_seq OWNER TO app_user;
      ALTER SEQUENCE comments_id_seq OWNER TO app_user;
      ALTER SEQUENCE tenants_id_seq OWNER TO app_user;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE users DISABLE ROW LEVEL SECURITY;
      ALTER TABLE posts DISABLE ROW LEVEL SECURITY;
      ALTER TABLE comments DISABLE ROW LEVEL SECURITY;

      DROP POLICY IF EXISTS user_policy ON users;
      DROP POLICY IF EXISTS post_policy ON posts;
      DROP POLICY IF EXISTS comment_policy ON comments;
    SQL
  end
end