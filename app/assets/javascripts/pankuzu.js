$(function(){
  const listContent = $(".breadCrumbs > ul");
  const angleRight = '<li><i class="fa fa-angle-right"></i></li>';
  let parentCategory = `<li><a href="#">${$('#parentCategory').text()}</a></li>`;
  let childCategory = `<li><a href="#">${$('#childCategory').text()}</a></li>`;
  let grandChildCategory = `<li><a href="#">${$('#grandChildCategory').text()}</a></li>`;

  if($('#parentCategory').length) {
    listContent.append(parentCategory);
  }
  if($('#childCategory').length) {
    listContent.append(angleRight);
    listContent.append(childCategory);
  }
  if($('#grandChildCategory').length) {
    listContent.append(angleRight);
    listContent.append(grandChildCategory);
  }
});
