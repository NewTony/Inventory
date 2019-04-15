local food = {
	items = {
		{
			id = 'food_0000',
			name = 'Test food',
			description = 'description_text',
			class = 'Food',
			receive = {},
			stackable = true,
			max_stack_count = 30
		},
		{
			id = 'food_0001',
			name = 'Bread',
			description = 'Bread desc.',
			class = 'Food',
			receive = {
				health = 10
			},
			stackable = true,
			max_stack_count = 30
		},
		{
			id = 'food_0002',
			name = 'Bread with butter',
			description = 'Bread with butter desc.',
			class = 'Food',
			receive = {
				health = 15,
				fatigue = 10
			},
			stackable = true,
			max_stack_count = 30
		}
	}
}

return food
