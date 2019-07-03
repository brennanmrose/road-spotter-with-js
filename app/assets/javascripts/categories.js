$(() => {
	bindClickHandlers();
})

const bindClickHandlers = () => {
	$('.all-categories').on('click', (e) => {
		e.preventDefault();
		history.pushState(null, null, "categories")
		getCategories();

	})

	$(document).on('click', ".show_link", function(e) {
		e.preventDefault();
		let id = $(this).attr('data-id')
		$('#app-container').html('')
		fetch(`/categories/${id}.json`)
			.then(response => response.json())
			.then(category => {
				let newCategory = new Category(category)

				let categoryHtml = newCategory.formatShow()

				$('#app-container').append(categoryHtml)
		})
	})

	$('#new_category').on('submit', function(e) {
		e.preventDefault();

		const values = $(this).serialize()

		$.post("/categories", values).done(function(data) {
				$('#app-container').html('')

				const newCategory = new Category(data)
				const htmlToAdd = newCategory.formatShow()

				$('#app-container').html(htmlToAdd)

			})
				// serializes information entered into form, allow us to send back to server

	})

	// $(document).on('click', 'next-post', function() {
	// 	let id = $(this).attr('data-id')
	// 	fetch(`categories/${id}/next`)
	// 		.then(response => response.json())
	// 		.then(category => {
	// 			let newCategory = new Category(category)

	// 			let categoryHtml = newCategory.formatShow()

	// 			$('#app-container').append(categoryHtml)
	// 	})
	// })
}

const getCategories = () => {
	fetch(`/categories.json`)
		.then(response => response.json())
		.then(data => {
			$('#app-container').html(`<h1>All Categories:</h1>`)
			data.forEach(category => {
				let newCategory = new Category(category)
				let categoryHtml = newCategory.formatIndex()
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
		<ul>
			<li><a href="/categories/${this.id}" data-id="${this.id}" class="show_link"<h1>${this.name}</h1></a></li>
		</ul>
	`
	return categoryHtml
}

Category.prototype.formatShow = function() {

	let reportedIssuesHtml = ``
		this.reported_issues.forEach( issue => {
			reportedIssuesHtml += `
				<ul>
					<li>${issue.chief_complaint}<br>${issue.locality}, ${issue.region} ${issue.postal_code}</li>
				</ul>
			`
	})

	let categoryHtml = 
	`
		<h1>${this.name}</h1>
		${reportedIssuesHtml}
	`
	return categoryHtml
}





