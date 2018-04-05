import React from 'react';
import { Card, CardBody } from 'reactstrap';


function Task(params) {
  let task = params.task;

  return<Card>
    <CardBody>
      <p>Assigned to: { task.user.name }</p>
      <p>Title: { task.title }</p>
      <p>Description: { task.description }</p>
      <p>Time Taken(In hours): { String(task.time) }</p>
      <p>Completed?: { task.completed }</p>
    </CardBody>

  </Card>
}

export default function Tasklist(params) {
let tasks = _.map(params.tasks, (pp) => <Task key={pp.id} task={pp} />)
return <div>
  <p>&nbsp;</p>
  <h1>Your Tasks</h1>
  { tasks }
  </div>
}
