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

	$(document).on('click', ".show_link", function(e) {
		e.preventDefault();
		$('#app-container').html('')
		let id = $(this).attr('data-id')
		fetch(`/categories/${id}.json`)
		.then(response => response.json())
		.then(category => {
			let newCategory = new Category(category)
			let categoryHtml = newCategory.formatShow()
			$('#app-container').append(categoryHtml)
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
		<a href="/categories/${this.id}" data-id="${this.id}" class="show_link"<h1>${this.name}</h1></a>
	`
	return categoryHtml
}

Category.prototype.formatShow = function() {
	let categoryHtml = `
		<h3>${this.name}</h3>
	`
	return categoryHtml
}