% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/surveyresponses.r
\name{survey_responses}
\alias{survey_responses}
\title{survey_responses}
\usage{
survey_responses(survey, response_format)
}
\arguments{
\item{survey}{A sm_survey object, as retrieved by \code{surveylist()}.}

\item{response_format}{A string indicating the desired data frame response format: 'Table' = one survey response per row and one column per question, or 'Column' = a key/value arrangement with each row holding data for a single question response}
}
\value{
A data frame with survey responses
}
\description{
Extracts data from the survey responses data set and formats it as a data frame for analysis
}
