function remove() {
  const dataId = document.getElementById("data-id")
  const id = dataId.getAttribute("data_id")
  if ( id >= 1 ) {
  const goalForm = document.getElementById("remove")
  goalForm.removeAttribute('action')
  goalForm.removeAttribute('method')
  goalForm.setAttribute('method', 'post')

  const dataId = document.getElementById("data-id")
  const id = dataId.getAttribute("data_id")
  goalForm.setAttribute('action', `/goals/${id}`)
  // console.log(b)
  // console.log(goalForm)
  }
}
document.addEventListener('DOMContentLoaded', remove);