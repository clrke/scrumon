# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

angular.module 'OrganizationsApp', []
	.controller 'TasksController', ['$http', ($http) ->
		c = this

		c.loaded = true

		c.newTask = ''
		c.tasks = [ ]

		c.add = ->
			$http.post '/tasks/create', {title: c.newTask, organization_id: c.org_id}
				.success (data) ->
					for i in [0...c.tasks.length]
						if c.tasks[i].id is -1
							c.tasks[i] = data
							break

			c.tasks.push {title: c.newTask, id: -1}
			c.newTask = ''

		c.alterStatus = (task) ->
			task.done = !task.done
			$http.post '/tasks/update', task
	]
