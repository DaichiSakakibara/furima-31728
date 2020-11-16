const pay = () => {
  Payjp.setPublicKey("pk_test_3ee75e7f62fec6e4be03c59b"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  const ItemPrice = document.getElementById("item-price");
  const price = ItemPrice.getAttribute("price-post");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    
    const card = {
      number: formData.get("user_order[number]"),
       exp_month: formData.get("user_order[exp_month]"),
       exp_year: `20${formData.get("user_order[exp_year]")}`,
       cvc: formData.get("user_order[cvc]"),
    };


    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"><input value=${price} name='price' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
       
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

       document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);