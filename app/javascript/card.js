const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);

  // Payjp.setPublicKey("pk_test_d874901967bed2c581720609"); // PAY.JPテスト公開鍵
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    console.log("フォーム送信時にイベント発火");

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_record_addresse[number]"),
      cvc: formData.get("purchase_record_addresse[cvc]"),
      exp_month: formData.get("purchase_record_addresse[exp_month]"),
      exp_year: `20${formData.get("purchase_record_addresse[exp_year]")}`,
    };

     Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;

        console.log(token)

        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' >`;
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
