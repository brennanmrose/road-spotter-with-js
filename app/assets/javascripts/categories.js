$(() => {
	bindClickHandlers();
})

const bindClickHandlers = () => {
	$('.all-categories').on('click', (e) => {
		e.preventDefault();
		history.pushState(null, null, "categories")
		fetch(`/categories.json`)
			.then(response => response.json())
			.then(data => {
				$('#app-container').html('')
				data.forEach(category => {
					let newCategory = new Category(category)
					let categoryHtml = newCategory.formatIndex()
					$('#app-container').append(categoryHtml)
				})
			})
	})
}

function Category(category) {
	this.id = category.id
	this.name = category.name
	this.reported_issues = category.reported_issues
}

Category.prototype.formatIndex = function() {
	let categoryHtml = `
		<a href="/categories/${this.id}"<h1>${this.name}</h1></a>
	`
	return categoryHtml
}