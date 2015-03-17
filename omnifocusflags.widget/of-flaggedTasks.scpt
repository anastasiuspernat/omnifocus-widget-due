JsOsaDAS1.001.00bplist00�Vscript_�of = Application('OmniFocus');

doc = of.defaultDocument;

getFlaggedTasks();


function getFlaggedTasks(){
	taskList = [];
	tasks = doc.flattenedTasks.whose({completed: false, flagged: true})();
	var today = new Date();
	tasks.forEach(function(task){
		if ( (!task.deferDate()) || (today > task.deferDate()) ) {
			context = (task.context() !== null) ? task.context().name() : '';
			project = (task.container() !== null) ? task.container().name() : '';
			taskList.push({
				name: task.name(),
				context: context,
				project: project,
				note: task.note(),
				
			});
		}
	});
	
	retObj = {
		'tasks' : taskList,
		'count' : taskList.length
	};

	return JSON.stringify(retObj);
}                              � jscr  ��ޭ