window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const commission  = document.getElementById("add-tax-price")
    commission.innerHTML = (Math.floor(inputValue * 0.1)).toLocaleString()
    const profit = document.getElementById("profit")
    profit.innerHTML =  Math.floor((inputValue * 0.9)).toLocaleString()

  })
})
