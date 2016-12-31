#コントローラー生成
bin/rails g controller tickets

# ER図
bundle exec erd --attributes=foreign_keys,primary_keys,content,timestamp --filename=erd_sample --filetype=pdf
rake erd filetype=pdf attributes=foreign_keys,primary_keys,timestamps,inheritance,content indirect=false sort=false
