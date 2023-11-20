INSERT INTO
	"users"("name", "password")
VALUES
	(
		'MrSmith',
		'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwidXNlciI6Ik1yU21pdGgiLCJwYXNzd29yZCI6IlRFU1RfUEFTU1dPUkQiLCJpYXQiOjE1MTYyMzkwMjJ9.XmAQEqIMxKZPov2eJdROcjVj_qfkNivH5iAytJHh2U4'
	);

INSERT INTO
	"products"("id", "title", "description", "price")
VALUES
	(
		'163f0682-7d24-42e4-af32-e110fbdfd4cb',
		'5 Centimes 1864 copy',
		'France 5 Centimes 1864 Bronze',
		34
	),
	(
		'7a5f4ada-ac90-45db-84b2-c81ee0039532',
		'1/2 Penny 1876 copy',
		'Great Britain 1/2 Penny 1876 Victoria 1837-1901 Bronze',
		12
	),
	(
		'4075ca46-ee51-4742-a6f9-15eec1e95500',
		'2 Pence 1904 copy',
		'Great Britain 2 Pence 1904 Edward VII 1901-1910 Silver',
		45
	),
	(
		'75eeb41c-0d7b-4116-ab75-0480f49f434c',
		'1 Pesos 1894 copy',
		'Spain 1 Pesos 1894 Silver',
		67
	);

INSERT INTO
	"carts"("user_id", "status")
SELECT
	(
		SELECT
			id
		FROM
			"users"
		WHERE
			name = 'MrSmith'
	),
	'OPEN';

INSERT INTO
	"cart_items"("cart_id", "product_id", "count")
SELECT
	(
		SELECT
			id
		FROM
			carts
		WHERE
			status = 'OPEN'
		LIMIT
			1
	), (
		SELECT
			id
		FROM
			products
		where
			title = '5 Centimes 1864 copy'
	),
	1;

INSERT INTO
	"orders"(
		"cart_id",
		"user_id",
		"payment",
		"delivery",
		"comments",
		"status",
		"total"
	)
SELECT
	(
		SELECT
			id
		FROM
			carts
		WHERE
			status = 'OPEN'
		LIMIT
			1
	), (
		SELECT
			id
		FROM
			"users"
		WHERE
			name = 'MrSmith'
	),
	'{"type":"card","address":"11 Street st.","creditCart":"1111"}',
	'{"type":"default","address":"11 Street st."}',
	'nice goods',
	'OPEN',
	34;