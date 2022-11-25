const pay = () => {
  Payjp.setPublicKey("pk_test_d874901967bed2c581720609"); // PAY.JPテスト公開鍵
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
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
      }
    });
  });
};

window.addEventListener("load", pay);
