if(document.URL.match(/tops/)) {
function expression() {
  // const previousMonth = document.querySelector("a");
  // previousMonth.addEventListener('click', () => {
  //   console.log(previousMonth)
  //   const incomeButton = document.getElementById("income-btn")
  //   incomeButton.disabled = true;
  // })
  // const previousMonth = document.querySelector("a")
  // if (previousMonth.onclick) {
  //   console.log(previousMonth)
  //   // document.addEventListener('DOMContentLoaded');
  // }

  const incomeButton = document.getElementById("income-btn")
  const outgoButton = document.getElementById("outgo-btn")
  incomeButton.disabled = true;
  document.getElementById("income-hidden").style.display ="block";
  document.getElementById("outgo-hidden").style.display ="none";
  outgoButton.addEventListener('click', () => {
    // if (e.getAttribute("data-load") != null) {
    //   return null;
    // }
    // e.setAttribute("data-load", "true");
    const incomeContent = document.getElementById("income-hidden")
    const outgoContent = document.getElementById("outgo-hidden")

    if(incomeContent.style.display=="block"){
      // noneで非表示
      incomeContent.style.display="none";
      outgoContent.style.display="block";
      outgoButton.disabled = true;
      incomeButton.disabled = false;
      // incomeButton.removeAttribute('disabled');
    // }else{
    //   // blockで表示
    //   incomeContent.style.display="block";
    //   outgoContent.style.display="none";
    }
    // incomeButton.onclick="disabled = true;"
  });
  // const incomeButton = document.getElementById("income-btn")
  incomeButton.addEventListener('click', () => {
    const incomeContent = document.getElementById("income-hidden")
    const outgoContent = document.getElementById("outgo-hidden")

    if(incomeContent.style.display=="none"){
      // noneで非表示
      // incomeContent.style.display="none";
      // outgoContent.style.display="block";
      incomeContent.style.display="block";
      outgoContent.style.display="none";
      incomeButton.disabled = true;
      outgoButton.disabled = false;
      // incomeButton.removeAttribute('disabled');
    // }else{
    //   // blockで表示
    //   incomeContent.style.display="block";
    //   outgoContent.style.display="none";
    }
    // incomeButton.onclick="disabled = true;"
  });
}
// window.addEventListener('load',expression);
document.addEventListener('DOMContentLoaded', expression);
}