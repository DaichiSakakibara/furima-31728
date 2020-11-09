
if (location.pathname.match("items")){
  document.addEventListener("DOMContentLoaded", () => {
    const itemPrice = document.getElementById("item-price");
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    itemPrice.addEventListener("keyup", () => {
      const price = document.getElementById("item-price").value;
      let fee = price / 10 ;
      fee = parseInt(fee);
      let salesProfit = price - fee ;
      addTaxPrice.innerHTML = `${fee}`;
      profit.innerHTML = `${salesProfit}`;
    });
  });
};




