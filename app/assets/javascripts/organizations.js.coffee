# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

angular.module 'OrganizationsApp', []
	.controller 'TasksController', ->
		c = this

		c.loaded = true

		c.newTask = ''
		c.tasks = [ ]

		c.add = ->
			c.tasks.push {title: c.newTask}
			c.newTask = ''
