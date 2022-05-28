function tax(){
  itemPrice = document.getElementById("item-price");
  addTaxPrice = document.getElementById("add-tax-price");
  profit = document.getElementById("profit")
  itemPrice.addEventListener("keyup", (e) => {
    let tax = Math.round(itemPrice.value*0.1);
    addTaxPrice.innerHTML = tax;
    profit.innerHTML = itemPrice.value - tax;
  });
}

window.addEventListener('load', tax);