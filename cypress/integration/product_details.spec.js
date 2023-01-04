describe("product details", () => {
  beforeEach(() => {
    //
  });

  it("Displays the home page and a user can click on a product", () => {
    cy.visit("http://localhost:3000");
    cy.get(".products article").should("be.visible");
    cy.get(".products article").first().click();
  });

  it("Shows the product detail page", () => {
    cy.get(".products-show").should("be.visible");
  });
});
