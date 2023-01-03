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

  it("Shows the number of items in the cart as 0", () => {
    cy.contains("My Cart (0)").should("be.visible");
  });

  it("The user can add a product to cart", () => {
    cy.get(".products article").first().find("button").click({ force: true });
  });

  it("Shows the number of items in the cart increased to 1", () => {
    cy.contains("My Cart (1)").should("be.visible");
  });
});
