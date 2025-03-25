test_that("Age conversion matches reference", {
  expect_equal(
    to_human_age(mref),
    href
  )
})

test_that("Age conversions are equivalent to one another", {
  expect_equal(
    to_human_age_dd(70),
    to_human_age_wd(10)
  )
  expect_equal(
    to_human_age_dd(365 / 12),
    to_human_age_md(1)
  )
  expect_equal(
    to_human_age_dd(365),
    to_human_age_yd(1)
  )
  expect_equal(
    to_human_age_dw(70),
    to_human_age_ww(10)
  )
  expect_equal(
    to_human_age_dw(365 / 12),
    to_human_age_mw(1)
  )
  expect_equal(
    to_human_age_dw(365),
    to_human_age_yw(1)
  )
  expect_equal(
    to_human_age_dm(70),
    to_human_age_wm(10)
  )
  expect_equal(
    to_human_age_dm(365 / 12),
    to_human_age_mm(1)
  )
  expect_equal(
    to_human_age_dm(365),
    to_human_age_ym(1)
  )
  expect_equal(
    to_human_age_dy(70),
    to_human_age_wy(10)
  )
  expect_equal(
    to_human_age_dy(365 / 12),
    to_human_age_my(1)
  )
  expect_equal(
    to_human_age_dy(365),
    to_human_age_yy(1)
  )
})

test_that("Output units are properly calibrated", {
  expect_equal(
    to_human_age_dd(365),
    to_human_age_dw(365) * 7
  )
  expect_equal(
    to_human_age_dd(365),
    to_human_age_dm(365) * (365/12)
  )
  expect_equal(
    to_human_age_dd(365),
    to_human_age_dy(365) * 365
  )
})
