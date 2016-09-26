#json.partial! "comments/comment", comment: @comment
#json.id @comment.id
#json.user_id @comment.user_id
#json.body @comment.body
#json.created_at @comment.created_at
#json.updated_at @comment.updated_at
json.extract! @comment, :id, :user_id, :articulo_id, :body, :created_at, :updated_at
json.user do
	json.email @comment.user.email
end