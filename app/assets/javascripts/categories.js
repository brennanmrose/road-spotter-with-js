$(() => {
	bindClickHandlers();
})

const bindClickHandlers = () => {
	$('.all-categories').on('click', (e) => {
		e.preventDefault();
		fetch(`/categories.json`)
			.then(response => response.json())
			.then(data => {
				$('#app-container').html('')
				data.forEach(category => {
					console.log(category)
				})
			})
	})
}

function Category(category) {
	this.id = category.id
	this.name = category.name
	this.reported_issues = category.reported_issues
}