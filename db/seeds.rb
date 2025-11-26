Comment.destroy_all
Post.destroy_all
User.destroy_all
Tenant.destroy_all

tenant_names = ["foo", "bar"]
tenant_names.each do |tenant_name|
  Tenant.create!(name: tenant_name, subdomain: tenant_name)
end

# 各テナントにシードデータを作成
Tenant.all.each do |tenant|
  Current.tenant_id = tenant.id

  puts "\n=== #{tenant.name} テナントのデータを作成中 ==="
    
  # 3人のユーザーを作成
  users = []
  3.times do |i|
    users << User.create!(name: "ユーザー#{i + 1}")
  end
    
  puts "#{users.count}人のユーザーを作成しました"
    
  # 各ユーザーに2件ずつ投稿を作成（合計6件）
  posts = []
  users.each_with_index do |user, i|
    2.times do |j|
      posts << user.posts.create!(body: "#{user.name}の投稿#{j + 1}です。これはサンプルテキストです。")
    end
  end
    
  puts "#{posts.count}件の投稿を作成しました"
    
  # すべての投稿に2件ずつコメントを作成
  comments_count = 0
  posts.each do |post|
    2.times do |i|
      # コメントするユーザーをランダムに選択
      commenting_user = users.sample
      post.comments.create!(
        user: commenting_user,
        body: "#{commenting_user.name}からのコメント#{i + 1}です。"
      )
      comments_count += 1
    end
  end
    
  puts "#{comments_count}件のコメントを作成しました"
end

puts "\nシードデータの作成が完了しました！"
