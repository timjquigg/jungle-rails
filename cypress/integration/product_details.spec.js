describe("home page", () => {
  beforeEach(() => {
    //
  });

  it("displays the home page", () => {
    cy.visit("http://localhost:3000");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("The user can click on a product", () => {
    cy.get(".products article").first().click();
  });

  it("Shows the product detail page", () => {
    cy.get(".products-show").should("be.visible");
  });
});
